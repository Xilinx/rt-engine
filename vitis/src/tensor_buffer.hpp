#pragma once

#include "./tensor.hpp"

namespace xir {
namespace vart {

class TensorBuffer {
protected:
  explicit TensorBuffer(const Tensor *tensor);

public:
  virtual ~TensorBuffer() = default;

public:
  virtual std::pair<void *, std::size_t>
  data(const std::vector<std::int32_t> idx = {}) = 0;

public:
  const Tensor *get_tensor() const;

protected:
  const Tensor *tensor_;
};

class CpuFlatTensorBuffer : public TensorBuffer {
public:
  explicit CpuFlatTensorBuffer(void *data, const Tensor *tensor);
  virtual ~CpuFlatTensorBuffer() = default;

public:
  virtual std::pair<void *, size_t>
  data(const std::vector<int> idx = {}) override;

private:
  void *data_;
};
} // namespace vart
} // namespace xir
