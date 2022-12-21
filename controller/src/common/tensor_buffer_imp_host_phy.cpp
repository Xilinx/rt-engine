// Copyright 2021 Xilinx Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "./tensor_buffer_imp_host_phy.hpp"

#include <sstream>
#include <xir/tensor/tensor.hpp>

#include "vitis/ai/env_config.hpp"

DEF_ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR, "0");
namespace vart {
namespace rt_engine {

TensorBufferExtImpHostPhy::TensorBufferExtImpHostPhy(void* data, const xir::Tensor* tensor)
    : TensorBuffer{tensor}, data_{data}, location_{location_t::HOST_PHY}, tensor_{tensor} {
  elem_num_ = tensor_->get_element_num();
  LOG_IF(INFO, ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR))
      << "TensorBufferExtImpHostPhy "
      << "@" << (void*)this << " created";
}
TensorBufferExtImpHostPhy::~TensorBufferExtImpHostPhy() {
  LOG_IF(INFO, ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR))
      << "TensorBufferExtImpHostPhy "
      << "@" << (void*)this << " destroyed";
}
TensorBuffer::location_t TensorBufferExtImpHostPhy::get_location() const {
  return location_;
}

std::pair<uint64_t, size_t> TensorBufferExtImpHostPhy::data_x(
    const std::vector<std::int32_t> idx_orig, int phy) {
  if (phy) {
    return data_phy(idx_orig);
  }
  return data(idx_orig);
}

std::pair<uint64_t, size_t> TensorBufferExtImpHostPhy::data(
      const std::vector<std::int32_t> idx = {}) {
    uint32_t size = tensor_->get_data_type().bit_width / 8;
    if (idx.size() == 0) {
      return {reinterpret_cast<uint64_t>(data_),
              elem_num_ * size};
    }
    auto dims = tensor_->get_shape();
    auto offset = 0;
    for (std::size_t k = 0; k < dims.size(); k++) {
      auto stride = 1;
      for (std::size_t m = k + 1; m < dims.size(); m++) {
        stride *= dims[m];
      }
      offset += idx[k] * stride;
    }
    //auto elem_num = tensor_->get_element_num();
    return {reinterpret_cast<uint64_t>(data_) + offset * size,
            (elem_num_ - offset) * size};
}

std::pair<uint64_t, size_t> TensorBufferExtImpHostPhy::data_phy(
  const std::vector<std::int32_t> idx) {
  uint32_t size = tensor_->get_data_type().bit_width / 8;
  auto dims = tensor_->get_shape();

  // single device buffer
  if (dbufs_.size() == 1) {
    if (idx.size() == 0) {
      return {dbufs_[0]->get_phys_addr(), elem_num_ * size};
    }

    auto offset = 0;
    for (std::size_t k = 0; k < dims.size(); k++) {
      auto stride = 1;
      for (std::size_t m = k + 1; m < dims.size(); m++) {
        stride *= dims[m];
      }
      offset += idx[k] * stride;
    }
    //auto elem_num = tensor_->get_element_num();
    return {dbufs_[0]->get_phys_addr() + offset * size,
          (elem_num_ - offset) * size};
  }

  // multi device buffers
  auto batch_len = 1;
  for (std::size_t m = 1; m < dims.size(); m++) {
    batch_len *= dims[m];
  }
  if (idx.size() == 0) {
    return {dbufs_[idx[0]]->get_phys_addr(), batch_len * size};
  }

  auto offset = 0;
  for (std::size_t k = 1; k < dims.size(); k++) {
    auto stride = 1;
    for (std::size_t m = k + 1; m < dims.size(); m++) {
      stride *= dims[m];
    }
    offset += idx[k] * stride;
  }
  return {dbufs_[idx[0]]->get_phys_addr() + offset * size,
          (batch_len - offset) * size};
}

std::vector<std::tuple<int, uint64_t, int>> TensorBufferExtImpHostPhy::host_to_dev_range(
    size_t batch_idx,
    size_t offset,
    size_t size) {
  CHECK_NE(dbufs_.size(), 0);
  auto dims = tensor_->get_shape();
  auto batch = dims[0];
  CHECK_LT(batch_idx, batch);

  std::vector<std::tuple<int, uint64_t, int>> dev_buffers;
  if (dbufs_.size() == 1) {
    CHECK_LE(offset + size, elem_num_);
    dev_buffers.push_back(std::make_tuple(0, offset, size));
  } else {
    CHECK_EQ(dbufs_.size(), batch);

    for (int i = 0; i < batch; i++) {
      dev_buffers.push_back(std::make_tuple(i, offset, size));
    }
  }

  return dev_buffers;
}

void TensorBufferExtImpHostPhy::sync_for_read(uint64_t offset, size_t size) {
  std::vector<std::tuple<int, uint64_t, int>> dev_buffers = host_to_dev_range(0, offset, size);
  for (auto& iter : dev_buffers) {
    dbufs_[std::get<0>(iter)]->sync_for_read(std::get<1>(iter), std::get<2>(iter));
  }
}

void TensorBufferExtImpHostPhy::sync_for_write(uint64_t offset, size_t size) {
  std::vector<std::tuple<int, uint64_t, int>> dev_buffers = host_to_dev_range(0, offset, size);
  for (auto& iter : dev_buffers) {
    dbufs_[std::get<0>(iter)]->sync_for_write(std::get<1>(iter), std::get<2>(iter));
  }
}

void TensorBufferExtImpHostPhy::copy_from_host(size_t batch_idx,
                                               const void* buf, size_t size,
                                               size_t offset) {
  std::vector<std::tuple<int, uint64_t, int>> dev_buffers = host_to_dev_range(batch_idx, offset, size);
  for (auto& iter : dev_buffers) {
    dbufs_[std::get<0>(iter)]->copy_from_host(buf, std::get<2>(iter), std::get<1>(iter));
  }
}

void TensorBufferExtImpHostPhy::copy_to_host(size_t batch_idx, void* buf,
                                             size_t size, size_t offset) {
  std::vector<std::tuple<int, uint64_t, int>> dev_buffers = host_to_dev_range(batch_idx, offset, size);
  for (auto& iter : dev_buffers) {
    dbufs_[std::get<0>(iter)]->copy_to_host(buf, std::get<2>(iter), std::get<1>(iter));
  }
}

void TensorBufferExtImpHostPhy::set_device_buffer(std::unique_ptr<DeviceBuffer> dbuf) {
  auto dims = tensor_->get_shape();
  auto batch = dims[0];
  CHECK_LT(dbufs_.size(), batch);

  dbufs_.emplace_back(std::move(dbuf));
}

}  // namespace rt_engine
}  // namespace vart
