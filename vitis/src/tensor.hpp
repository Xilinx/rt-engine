#pragma once

#include <string>
#include <vector>

namespace xir {
namespace vart {

class Tensor {
public:
  enum class DataType {
    INT8,
    UINT8,
    INT16,
    UINT16,
    INT32,
    UINT32,
    FLOAT,
    DOUBLE,
    UNKNOWN
  };

public:
  Tensor(const std::string &name, const std::vector<std::int32_t> &dims,
         DataType data_type);
  Tensor() = delete;

public:
  const std::string& get_name() const;

  const std::int32_t get_dim_num() const;

  const std::int32_t get_element_num() const;

  const std::int32_t get_dim_size(std::int32_t idx) const;

  const std::vector<std::int32_t>& get_dims() const;

  const DataType get_data_type() const;

private:
  const std::string name_;
  const std::vector<std::int32_t> dims_;
  const DataType data_type_;
};

std::size_t size_of(Tensor::DataType data_type);
}
}
