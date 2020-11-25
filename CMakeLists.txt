cmake_minimum_required(VERSION 3.9)

if(DEFINED ENV{BUILD_VER})
  project(rt-engine VERSION $ENV{BUILD_VER} LANGUAGES C CXX)
else()
  project(rt-engine VERSION 1.3.0 LANGUAGES C CXX)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
add_definitions("-fpermissive" "-Wall")

set(CMAKE_VERBOSE_MAKEFILE ON)

message("-- Host system processor is ${CMAKE_HOST_SYSTEM_PROCESSOR}")
message("-- Target system processor is ${CMAKE_SYSTEM_PROCESSOR}")

set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_SOURCE_DIR}/cmake")

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
find_package(Boost REQUIRED)
find_package(Protobuf REQUIRED)
find_package(jsoncpp REQUIRED)
find_package(OpenCV REQUIRED)
find_package(glog REQUIRED)
find_package(pybind11 REQUIRED)
find_package(unilog REQUIRED)
find_package(target-factory REQUIRED)
find_package(xir REQUIRED)
find_package(xip REQUIRED)
find_package(vart COMPONENTS runner REQUIRED)
find_package(Xrt REQUIRED)
find_package(glog REQUIRED)

file(
  GLOB_RECURSE
  ENGINE_SRCS
  "engine/src/*.cpp"
  )

file(
  GLOB_RECURSE
  RUNNER_SRCS
  "runner/src/*.cpp"
  )

file(
  GLOB_RECURSE
  DEVICE_SRCS
  "device/src/*.cpp"
  )

file(
  GLOB_RECURSE
  CONTROLLER_SRCS
  "controller/src/*.cpp"
  )

file(
  GLOB_RECURSE
  VITIS_SRCS
  "vitis/src/*.cpp"
  )

# XRM not yet supported
#add_definitions(-DXRM)

##########################
# Includes for all targets
##########################
include_directories(
  ${Protobuf_INCLUDE_DIRS}
  ${XRT_INCLUDE_DIRS}
  ${xip_INCLUDE_DIRS}
  ${unilog_INCLUDE_DIRS}
  ${target-factory_INCLUDE_DIRS}
  ${xir_INCLUDE_DIRS}
  ${vart_INCLUDE_DIRS}
  ${CMAKE_SOURCE_DIR}/engine/src
  ${CMAKE_SOURCE_DIR}/runner/src
  ${CMAKE_SOURCE_DIR}/device/src
  ${CMAKE_SOURCE_DIR}/controller/src
  ${CMAKE_SOURCE_DIR}/controller/src/dpuv3me
  ${CMAKE_SOURCE_DIR}/controller/src/dpuv4e
  ${CMAKE_SOURCE_DIR}/controller/src/dpuv3int8
  ${CMAKE_SOURCE_DIR}/vitis/src
  )

add_library(
  ${PROJECT_NAME}
  SHARED 
  ${ENGINE_SRCS}
  ${RUNNER_SRCS}
  ${DEVICE_SRCS}
  ${CONTROLLER_SRCS}
  ${VITIS_SRCS}
  )
target_link_libraries(
  ${PROJECT_NAME}
  PRIVATE
  ${Protobuf_LIBRARIES}
  unilog::unilog
  target-factory::target-factory 
  xir::xir
  vart::runner
  xip::butler
  XRT::XRT
  #XRT::xilinxopencl
  #XRT::xrt_core
  glog::glog
  jsoncpp_lib
  )
set_target_properties(
  ${PROJECT_NAME}
  PROPERTIES
  INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/lib
  INSTALL_RPATH_USE_LINK_PATH TRUE
  )

##########################
# Install Libraries
##########################
install(
  TARGETS
  ${PROJECT_NAME}
  EXPORT ${PROJECT_NAME}-targets
  COMPONENT
  base
  DESTINATION lib
  )

##########################
# Help Other CMAKE Prjs
##########################
include(CMakePackageConfigHelpers)

file(RELATIVE_PATH REL_INCLUDE_DIR
  ${CMAKE_INSTALL_PREFIX}/share/cmake/${PROJECT_NAME}
  ${CMAKE_INSTALL_PREFIX}/include/xip/butler
  )

set(CONF_INCLUDE_DIRS "\${${PROJECT_NAME}_CMAKE_DIR}/${REL_INCLUDE_DIR}")

configure_file (
  ${CMAKE_SOURCE_DIR}/cmake/config.in
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake
  @ONLY
  )
write_basic_package_version_file (
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY AnyNewerVersion
  )
install (
  FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
  DESTINATION ${CMAKE_INSTALL_PREFIX}/share/cmake/${PROJECT_NAME}
  COMPONENT base
  )
install(
  EXPORT ${PROJECT_NAME}-targets
  NAMESPACE ${PROJECT_NAME}::
  DESTINATION ${CMAKE_INSTALL_PREFIX}/share/cmake/${PROJECT_NAME}
  COMPONENT base
  )

##########################
# Test Executables TBD
##########################
