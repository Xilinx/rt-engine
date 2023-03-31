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

#include "./tensor_buffer_imp_view.hpp"

#include <sstream>
#include <xir/tensor/tensor.hpp>
#include <math.h>
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
  // when dims[0] from xir is bigger than 1, need to handle data in tensor_batch in etch tensorbuffer
  tensor_batch = tensor->get_shape()[0]/backstore_.size();
  CHECK_EQ(tensor->get_shape()[0], tensor_batch*backstore_.size());
  LOG_IF(INFO, ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR) >= 3)
      << " TensorBufferExtImpView created: " << to_string();
  ;
}

TensorBufferExtImpView::~TensorBufferExtImpView() {
  LOG_IF(INFO, ENV_PARAM(DEBUG_TENSOR_BUFFER_ALLOCATOR) >= 3)
      << "TensorBufferView "
      << "@" << (void*)this << " destroyed";

}

TensorBuffer::location_t TensorBufferExtImpView::get_location() const {
  return location_t::HOST_PHY; 
}

std::pair<uint64_t, size_t> TensorBufferExtImpView::data_x(
    const std::vector<std::int32_t> idx_orig, int phy) {
  std::vector<int32_t> idx;//= std::vector<int32_t>(idx_orig);
  //auto dims_orig = get_tensor()->get_shape();
  //if (idx_orig.size() == 0) {
  //  for (size_t i = 0; i < dims_orig.size(); i++)
  //    dims_orig[i] = 0;
  //  idx = std::vector<int32_t>(dims_orig);
  //} else {
  //  idx = std::vector<int32_t>(idx_orig);
  //}
  //auto tensor = get_tensor();
  auto dims = tensor_->get_shape();
  size_t offset = 0;

  if (idx_orig.size()) {
    UNI_LOG_CHECK(dims.size() == idx_orig.size(), VART_TENSOR_BUFFER_DIMS_ERROR);
    //CHECK_EQ(dims.size(), idx_orig.size());
    idx = std::vector<int32_t>(idx_orig);
  } else {
    idx = std::vector<int32_t>(dims.size(), 0);
  }
  auto batch_idx = idx[0];
  CHECK_LT(batch_idx, dims[0]);
  const auto batch = dims[0];
  idx[0] = 0;
  dims[0] = 1;
  //auto calc1 = vitis::ai::DimCalc(dims);
  //auto offset_in_single_batch = (int)calc1.offset(idx);
    for (std::size_t k = 0; k < dims.size(); k++) {
      auto stride = 1;
      for (std::size_t m = k + 1; m < dims.size(); m++) {
        stride *= dims[m];
      }
      offset += idx[k] * stride;
    }
  auto offset_in_single_batch = offset;
  auto size_in_single_batch = tensor_->get_data_size() / batch;
  UNI_LOG_CHECK(offset_in_single_batch <= size_in_single_batch, VART_TENSOR_BUFFER_CHECK_ERROR);
  //CHECK_LE(offset_in_single_batch, size_in_single_batch);
  auto size_left_in_single_batch =
      size_in_single_batch - offset_in_single_batch;
  CHECK_GE(size_in_single_batch, 0);

  uint64_t data_back;
  size_t size_back;
  int buf_idx = floor(batch_idx/tensor_batch);
  if (backstore_batch) {
    if (phy) {
      std::tie(data_back, size_back) =
          backstore_[buf_idx]->data_phy({0, offset_in_single_batch});
    } else {
      std::tie(data_back, size_back) =
          backstore_[buf_idx]->data({0, offset_in_single_batch});
    }

  } else {
    if (phy) {
      std::tie(data_back, size_back) =
          backstore_[0]->data_phy({buf_idx, offset_in_single_batch});
    } else {
      std::tie(data_back, size_back) =
          backstore_[0]->data({buf_idx, offset_in_single_batch});
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
  int idx = floor(batch_idx/tensor_batch);
  if (backstore_batch) {
    backstore_[idx]->copy_from_host(0, buf, size, offset + offset_);
  }  else {
    backstore_[0]->copy_from_host(idx, buf, size, offset + offset_);
  }
}
void TensorBufferExtImpView::copy_to_host(size_t batch_idx, void* buf,
                                          size_t size, size_t offset) {
  int idx = floor(batch_idx/tensor_batch);
  if (backstore_batch) {
    backstore_[idx]->copy_to_host(0, buf, size, offset + offset_);
  } else  {
    backstore_[0]->copy_to_host(idx, buf, size, offset + offset_);
  }
}

}  // namespace vart
