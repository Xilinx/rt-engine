
if(${XRM_FOUND})
  set(XRM_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/device_handle_xrm.cpp)
else()
  set(XRM_SRCS "")
endif()

set(DEVICE_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/device_handle.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/device_memory.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/device_memory_native.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/xrt_bin_stream.cpp
  ${XRM_SRCS}
  PARENT_SCOPE
  )

set(DEVICE_HDRS
  ${PROJECT_SOURCE_DIR}/device/src
  PARENT_SCOPE
  )
