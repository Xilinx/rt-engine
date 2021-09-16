/**
 * Copyright (C) 2021 Xilinx, Inc
 *
 * Licensed under the Apache License, Version 2.0 (the "License"). You may
 * not use this file except in compliance with the License. A copy of the
 * License is located at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

#pragma once
#include <memory>
#include <cstdlib>

constexpr size_t PAGE_SIZE = 4096;

namespace rte {

inline size_t getpagesize() {return PAGE_SIZE;}

inline int
posix_memalign(void **memptr, size_t alignment, size_t size)
{
#if defined(__GNUC__)
  return ::posix_memalign(memptr,alignment,size);
#elif defined(_WIN32)
  // this is not good, _aligned_malloc requires _aligned_free
  // power of 2
  if (!alignment || (alignment & (alignment - 1)))
    return EINVAL;

  auto save = errno;
  auto ptr = _aligned_malloc(size,alignment);
  if (!ptr) {
    errno = save;
    return ENOMEM;
  }

  *memptr = ptr;
  return 0;
#endif
}

struct aligned_ptr_deleter
{
#if defined(_WIN32)
  void operator() (void* ptr)  { _aligned_free(ptr); }
#else
  void operator() (void* ptr)  { free(ptr); }
#endif
};
using aligned_ptr_type = std::unique_ptr<void, aligned_ptr_deleter>;
inline aligned_ptr_type
aligned_alloc(size_t align, size_t size)
{
  // power of 2
  if (!align || (align & (align - 1)))
    throw std::runtime_error("rte::aligned_alloc requires power of 2 for alignment");

#if defined(_WIN32)
  return aligned_ptr_type(_aligned_malloc(size, align));
#else
  return aligned_ptr_type(::aligned_alloc(align, size));
#endif
}
  
// Memory alignment for DDR and AXI-MM trace access
template <typename T> 
struct AlignedAllocator {
public:
    
  using value_type = T;
    
  T* allocate(size_t count) {
    void* ptr = nullptr;
    if (rte::posix_memalign(&ptr, PAGE_SIZE, count * sizeof(T)))
      throw std::bad_alloc();
    return reinterpret_cast<T*>(ptr);	
  }

  void deallocate(T *ptr, size_t count) {
    
    if(ptr) {
	rte::aligned_ptr_deleter pDel;
	pDel(ptr);
    }
  }
};

} // rte
