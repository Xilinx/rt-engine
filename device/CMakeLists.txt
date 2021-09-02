
set(DEVICE_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/device_handle.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/device_memory.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/xrt_bin_stream.cpp
  PARENT_SCOPE
  )

set(DEVICE_HDRS
  ${CMAKE_SOURCE_DIR}/device/src
  PARENT_SCOPE
  )
