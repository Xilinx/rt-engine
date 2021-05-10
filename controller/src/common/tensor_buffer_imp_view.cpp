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

#include "./tensor_buffer_imp_view.hpp"

#include <sstream>
#include <xir/tensor/tensor.hpp>

//#include "vitis/ai/dim_calc.hpp"
#include "vitis/ai/env_config.hpp"
DEF_ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR, "0")
namespace vart {
TensorBufferExtImpView::TensorBufferExtImpView(
    const xir::Tensor* tensor, size_t offset,
    std::vector<vart::TensorBuffer*> backstore)
    : TensorBuffer(xir::Tensor::clone(tensor).release()),
      tensor_{
          std::unique_ptr<xir::Tensor>(const_cast<xir::Tensor*>(get_tensor()))},
      offset_{offset} {
  for (unsigned i =0; i< backstore.size();i++) 
    backstore_.emplace_back(backstore[i]);
  if (backstore.size() != 1)
    backstore_batch = true;
  LOG_IF(INFO, ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR) >= 3)
      << " TensorBufferExtImpView created: " << to_string();
  ;
}

TensorBufferExtImpView::~TensorBufferExtImpView() {
  LOG_IF(INFO, ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR) >= 3)
      << " TensorBufferExtImpView destroyed: " << to_string();
  ;
}

TensorBuffer::location_t TensorBufferExtImpView::get_location() const {
  return backstore_[0]->get_location();
}

std::pair<uint64_t, size_t> TensorBufferExtImpView::data_x(
    const std::vector<std::int32_t> idx_orig, int phy) {
  std::vector<int32_t> idx;//= std::vector<int32_t>(idx_orig);
  auto dims_orig = get_tensor()->get_shape();
  if (idx_orig.size() == 0) {
    for (size_t i = 0; i < dims_orig.size(); i++)
      dims_orig[i] = 0;
    idx = std::vector<int32_t>(dims_orig);
  } else {
    idx = std::vector<int32_t>(idx_orig);
  }
  auto dims = get_tensor()->get_shape();
  auto batch_idx = idx[0];
  const auto batch = dims[0];
  idx[0] = 0;
  dims[0] = 1;
  //auto calc1 = vitis::ai::DimCalc(dims);
  //auto offset_in_single_batch = (int)calc1.offset(idx);
    auto offset = 0;
    for (std::size_t k = 0; k < get_tensor()->get_shape().size(); k++) {
      auto stride = 1;
      for (std::size_t m = k + 1; m < get_tensor()->get_shape().size(); m++) {
        stride *= dims[m];
      }
      offset += idx[k] * stride;
    }
  auto offset_in_single_batch = offset;
  auto size_in_single_batch = get_tensor()->get_data_size() / batch;
  CHECK_LE(offset_in_single_batch, size_in_single_batch);
  auto size_left_in_single_batch =
      size_in_single_batch - offset_in_single_batch;
  CHECK_GE(size_in_single_batch, 0);

  uint64_t data_back;
  size_t size_back;
  if (backstore_batch) {
    if (phy) {
      std::tie(data_back, size_back) =
          backstore_[batch_idx]->data_phy({0, offset_in_single_batch});
    } else {
      std::tie(data_back, size_back) =
          backstore_[batch_idx]->data({0, offset_in_single_batch});
    }

  } else { 
    if (phy) {
      std::tie(data_back, size_back) =
          backstore_[0]->data_phy({batch_idx, offset_in_single_batch});
    } else {
      std::tie(data_back, size_back) =
          backstore_[0]->data({batch_idx, offset_in_single_batch});
    }
  }
  //LOG_IF(INFO, ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR) >= 3)
  //    << " TensorBufferExtImpView data: " << data_back 
  //    << " size " << size_back 
  //    <<" offset_ " << offset_
  //    <<" offset " << offset
  //    << " size left " << size_left_in_single_batch;
  return std::make_pair(data_back + offset_, (size_t)size_left_in_single_batch);
}
std::pair<uint64_t, size_t> TensorBufferExtImpView::data_phy(
    const std::vector<std::int32_t> idx) {
  return data_x(idx, 1);
}
std::pair<std::uint64_t, std::size_t> TensorBufferExtImpView::data(
    const std::vector<std::int32_t> idx) {
  return data_x(idx, 0);
}

void TensorBufferExtImpView::sync_for_read(uint64_t offset, size_t size) {
  if (backstore_batch) {
    for (unsigned i=0;i<backstore_.size(); i++)
      backstore_[i]->sync_for_read(offset + offset_, size);
  }
  else
    backstore_[0]->sync_for_read(offset + offset_, size);
}

void TensorBufferExtImpView::sync_for_write(uint64_t offset, size_t size) {
  if (backstore_batch) {
    for (unsigned i=0;i<backstore_.size(); i++)
      backstore_[i]->sync_for_write(offset + offset_, size);
  } else {
    backstore_[0]->sync_for_write(offset + offset_, size);
  }
}

void TensorBufferExtImpView::copy_from_host(size_t batch_idx, const void* buf,
                                            size_t size, size_t offset) {
  if (backstore_batch) {
    backstore_[batch_idx]->copy_from_host(0, buf, size, offset + offset_);
  }  else {
    backstore_[0]->copy_from_host(batch_idx, buf, size, offset + offset_);
  }
}
void TensorBufferExtImpView::copy_to_host(size_t batch_idx, void* buf,
                                          size_t size, size_t offset) {
  if (backstore_batch) {
    backstore_[batch_idx]->copy_to_host(0, buf, size, offset + offset_);
  } else  {
    backstore_[0]->copy_to_host(batch_idx, buf, size, offset + offset_);
  }
}

}  // namespace vart
