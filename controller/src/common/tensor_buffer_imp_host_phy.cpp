/*
 * Copyright 2019 Xilinx Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "./tensor_buffer_imp_host_phy.hpp"

#include <sstream>
#include <xir/tensor/tensor.hpp>

//#include "vitis/ai/dim_calc.hpp"
#include "vitis/ai/env_config.hpp"

DEF_ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR, "0");
namespace vart {
namespace rt_engine {

TensorBufferExtImpHostPhy::TensorBufferExtImpHostPhy(void* data, const xir::Tensor* tensor)
    : TensorBuffer{tensor},tensor_{tensor}, data_{data}, location_{location_t::HOST_PHY} {

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
              tensor_->get_element_num() * size};
    }
    auto dims = tensor_->get_shape();
    auto idx_real = idx;
    //idx_real[0] = 0;
    auto offset = 0;
    for (std::size_t k = 0; k < tensor_->get_shape().size(); k++) {
      auto stride = 1;
      for (std::size_t m = k + 1; m < tensor_->get_shape().size(); m++) {
        stride *= dims[m];
      }
      offset += idx_real[k] * stride;
    }
    auto elem_num = tensor_->get_element_num();
    //LOG_IF(INFO, ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR))
    //<<data_ <<  " offset " << offset << " elem_num " << elem_num << " size " << size; 
    return {reinterpret_cast<uint64_t>(data_) + offset * size,
            (elem_num - offset) * size};
}

std::pair<uint64_t, size_t> TensorBufferExtImpHostPhy::data_phy(
    const std::vector<std::int32_t> idx) {
  std::pair<uint64_t, size_t> vir_data = data(idx);
  //uint64_t offset = std::get<0>(vir_data) - reinterpret_cast<uint64_t>(data_);
  uint64_t offset=0;
  uint64_t phy_addr = dbufs_[idx[0]]->get_phys_addr();
  return {phy_addr + offset, std::get<1>(vir_data)};
}

std::vector<std::tuple<int, uint64_t, int>> TensorBufferExtImpHostPhy::host_to_dev_range(
    size_t batch_idx,
    size_t offset,
    size_t size) {
  CHECK_NE(dbufs_.size(), 0);
  auto dims = get_tensor()->get_shape();
  auto batch = dims[0];
  CHECK_LT(batch_idx, batch);

  std::vector<std::tuple<int, uint64_t, int>> dev_buffers;
  if (dbufs_.size() == 1) {
    CHECK_LE(offset + size, get_tensor()->get_data_size());
    dev_buffers.push_back(std::make_tuple(0, offset, size));
  } else {
    size_t batch_len = get_tensor()->get_data_size() / batch;
    CHECK_EQ(dbufs_.size(), batch);
    //size_t total_offset = (batch_len * batch_idx) + offset;
    //CHECK_LE(total_offset + size, get_tensor()->get_data_size());

    for (int i = 0; i < batch; i++) {
          dev_buffers.push_back(std::make_tuple(i, offset, size));
      //size_t batch_start = batch_len * i;
      //size_t batch_end = batch_len * (i + 1);
      //if (total_offset < batch_end) {
      //  if (total_offset + size < batch_end) {
      //    dev_buffers.push_back(std::make_tuple(i, total_offset - batch_start, size));
      //    break;
      //  } else {
      //    size_t range_size = batch_end - total_offset;
      //    dev_buffers.push_back(std::make_tuple(i, total_offset - batch_start, range_size));
      //    total_offset = batch_end;
      //    size -= range_size;
      //  }
      //}
    }
  }

  return dev_buffers;
}

void TensorBufferExtImpHostPhy::sync_for_read(uint64_t offset, size_t size) {
  std::vector<std::tuple<int, uint64_t, int>> dev_buffers = host_to_dev_range(0, offset, size);
  for (auto iter : dev_buffers) {
    dbufs_[std::get<0>(iter)]->sync_for_read(std::get<1>(iter), std::get<2>(iter));
  }
}

void TensorBufferExtImpHostPhy::sync_for_write(uint64_t offset, size_t size) {
  std::vector<std::tuple<int, uint64_t, int>> dev_buffers = host_to_dev_range(0, offset, size);
  for (auto iter : dev_buffers) {
    dbufs_[std::get<0>(iter)]->sync_for_write(std::get<1>(iter), std::get<2>(iter));
  }
}

void TensorBufferExtImpHostPhy::copy_from_host(size_t batch_idx,
                                               const void* buf, size_t size,
                                               size_t offset) {
  std::vector<std::tuple<int, uint64_t, int>> dev_buffers = host_to_dev_range(batch_idx, offset, size);
  for (auto iter : dev_buffers) {
    dbufs_[std::get<0>(iter)]->copy_from_host(buf, std::get<2>(iter), std::get<1>(iter));
  }
}

void TensorBufferExtImpHostPhy::copy_to_host(size_t batch_idx, void* buf,
                                             size_t size, size_t offset) {
  std::vector<std::tuple<int, uint64_t, int>> dev_buffers = host_to_dev_range(batch_idx, offset, size);
  for (auto iter : dev_buffers) {
    dbufs_[std::get<0>(iter)]->copy_to_host(buf, std::get<2>(iter), std::get<1>(iter));
  }
}

void TensorBufferExtImpHostPhy::set_device_buffer(std::unique_ptr<DeviceBuffer> dbuf) {
//void TensorBufferExtImpHostPhy::set_device_buffer(DeviceBuffer* dbuf) {
  auto dims = get_tensor()->get_shape();
  auto batch = dims[0];
  //CHECK_EQ(dbufs_.size(), batch);

  //if (dbuf->get_size() == dbufs_.size()) {
  //  CHECK_EQ(dbufs_.size(), 0);
  //} else {
  //  CHECK_EQ(dbuf->get_size(), get_tensor()->get_data_size() / batch);
  //}

  //dbufs_.emplace_back(std::move(dbuf));
  dbufs_.emplace_back(std::move(dbuf));

}

}  // namespace rt_engine
}  // namespace vart
