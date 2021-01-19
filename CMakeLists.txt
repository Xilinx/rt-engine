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

#set(CMAKE_VERBOSE_MAKEFILE ON)

message("-- Host system processor is ${CMAKE_HOST_SYSTEM_PROCESSOR}")
message("-- Target system processor is ${CMAKE_SYSTEM_PROCESSOR}")

set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_SOURCE_DIR}/cmake")

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
find_package(Boost COMPONENTS system filesystem REQUIRED)
find_package(jsoncpp REQUIRED)
find_package(OpenCV REQUIRED)
find_package(glog REQUIRED)
find_package(pybind11 REQUIRED)
find_package(unilog REQUIRED)
find_package(target-factory REQUIRED)
find_package(xir REQUIRED)
find_package(xip REQUIRED)
find_package(vart COMPONENTS runner REQUIRED)
find_package(glog REQUIRED)
find_package(Protobuf REQUIRED) # rt-engine does not need, but this is forced upon us by target-factory

# XRM not yet supported
#add_definitions(-DXRM)
#find_package(XRM REQUIRED)

# Fix Some Day
# Would prefer to find XRT the normal way
find_package(Xrt REQUIRED)
#find_package(XRT REQUIRED PATHS /opt/xilinx/xrt)

find_path(JSONC_INCLUDE_DIRS NAMES json-c) 
find_library(JSONC_LIBRARIES NAMES json-c REQUIRED)

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

##########################
# Includes for all targets
##########################
include_directories(
  ${OpenCV_INCLUDE_DIRS}
  ${XRT_INCLUDE_DIRS}
  ${xip_INCLUDE_DIRS}
  ${unilog_INCLUDE_DIRS}
  ${target-factory_INCLUDE_DIRS}
  ${xir_INCLUDE_DIRS}
  ${vart_INCLUDE_DIRS}
  ${JSONCPP_INCLUDE_DIRS}
  ${JSONC_INCLUDE_DIRS}
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
  target-factory::target-factory 
  ${Protobuf_LIBRARIES}
  vart::runner
  xip::butler
  XRT::XRT
  #${XRT_OPENCL_LIBRARIES}
  #${XRT_CORE_LIBRARIES}
  glog::glog
  jsoncpp_lib
  ${JSONC_LIBRARIES}
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
  COMPONENT base
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
  COMPONENT base
  DESTINATION share/cmake/${PROJECT_NAME}
  )
install(
  EXPORT ${PROJECT_NAME}-targets
  NAMESPACE ${PROJECT_NAME}::
  COMPONENT base
  DESTINATION share/cmake/${PROJECT_NAME}
  )

#########################
# Generate Debian
#########################
#set(CPACK_GENERATOR "DEB")
set(CPACK_PACKAGE_NAME "librt-engine")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "xsun@xilinx.com")
set(CPACK_DEB_COMPONENT_INSTALL ON)
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "3")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_PACKAGING_INSTALL_PREFIX "/usr")
set(CPACK_DEBIAN_ENABLE_COMPONENT_DEPENDS ON)
set(CPACK_DEBIAN_PACKAGE_SECTION "devel")
set(CPACK_DEBIAN_ARCHIVE_TYPE "gnutar")
set(CPACK_DEBIAN_COMPRESSION_TYPE "gzip")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libvart (>=0.0.1)")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
if(DEFINED ENV{BUILD_NUMBER})
  set(CPACK_DEBIAN_PACKAGE_RELEASE "r$ENV{BUILD_NUMBER}")
endif()
if(CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
  set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "arm64")
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
  set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
else()
  set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE ${CMAKE_SYSTEM_PROCESSOR})
endif()
set(CPACK_RPM_COMPONENT_INSTALL ON)
set(CPACK_RPM_PACKAGE_LICENSE "Apache")
set(CPACK_RPM_PACKAGE_GROUP "Development/Tools")
set(CPACK_RPM_COMPRESSION_TYPE "xz")
#set(CPACK_RPM_PACKAGE_REQUIRES "libxir >= 1.2.0, libunilog >= 1.2.0, libtarget-factory >= 1.2.0")
set(CPACK_RPM_FILE_NAME RPM-DEFAULT)
if(DEFINED ENV{BUILD_NUMBER})
  set(CPACK_RPM_PACKAGE_RELEASE "r$ENV{BUILD_NUMBER}")
endif()
set(CPACK_RPM_PACKAGE_ARCHITECTURE ${CMAKE_SYSTEM_PROCESSOR})

set(CPACK_COMPONENTS_GROUPING ALL_COMPONENTS_IN_ONE)

include(CPack)

cpack_add_component_group(all)
cpack_add_component(base GROUP all)

#########################
# Test Executables
#########################

file(
  GLOB
  TESTS
  "tests/*"
  )

foreach(test ${TESTS})
  get_filename_component(exe ${test} NAME)
  file(GLOB_RECURSE TEST_SRCS "tests/${exe}/*.cpp")
  add_executable("${exe}.exe" ${TEST_SRCS})
  target_link_libraries(
    "${exe}.exe"
    PRIVATE
    ${PROJECT_NAME}
    opencv_core
    opencv_imgproc
    opencv_highgui
    opencv_imgcodecs
    ${Boost_SYSTEM_LIBRARY}
    ${Boost_FILESYSTEM_LIBRARY}
    vart::runner
    glog::glog
    ${JSONC_LIBRARIES}
    )
  set_target_properties(
    "${exe}.exe"
    PROPERTIES
    INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/lib
    INSTALL_RPATH_USE_LINK_PATH TRUE
    )
  install(
    TARGETS
    "${exe}.exe"
    COMPONENT tests
    DESTINATION bin
    )
endforeach()

