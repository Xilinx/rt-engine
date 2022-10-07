cmake_minimum_required(VERSION 3.9)
  
if(DEFINED ENV{BUILD_VER})
  project(rt-engine VERSION $ENV{BUILD_VER})
else()
  project(rt-engine VERSION 2.5.0)
endif()

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

include(setup)

find_package(XRT REQUIRED HINTS /opt/xilinx/xrt)
find_package(XRM)
if (${XRM_FOUND})
  message(STATUS "XRM was found at ${XRM_CMAKE_DIR}")
  add_definitions(-DXRM_FOUND)
endif()
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  find_package(unilog REQUIRED)
  find_package(target-factory REQUIRED)
  find_package(xir REQUIRED)
  find_package(vart COMPONENTS util runner trace REQUIRED)
endif()
find_package(glog QUIET)
if(NOT glog_FOUND)
  message(STATUS "cannot find glogConfig.cmake fallback to pkg-config")
  find_package(PkgConfig)
  pkg_search_module(PKG_GLOG REQUIRED IMPORTED_TARGET GLOBAL libglog)
  add_library(glog::glog ALIAS PkgConfig::PKG_GLOG)
  set(GLOG_INCLUDE_DIRS ${PKG_GLOG_INCLUDEDIR})
else()
  get_target_property(GLOG_INCLUDE_DIRS glog::glog INTERFACE_INCLUDE_DIRECTORIES)
endif(NOT glog_FOUND)
find_package(Protobuf REQUIRED) # rt-engine does not need
find_path(JSONC_INCLUDE_DIRS NAMES json-c)
find_library(JSONC_LIBRARIES NAMES json-c REQUIRED)
find_package(Threads REQUIRED)

if(UNIX)
#for ubuntu20.04
find_package(Boost COMPONENTS system filesystem thread serialization REQUIRED)
else()
# Temporary hack for windows
find_package(Boost)
endif()

add_subdirectory(engine)
add_subdirectory(runner)
add_subdirectory(controller)
add_subdirectory(device)

include_directories(
  ${XRT_INCLUDE_DIRS}
  ${XRM_INCLUDE_DIRS}
  ${target-factory_INCLUDE_DIRS}
  ${xir_INCLUDE_DIRS}
  ${vart_INCLUDE_DIRS}
  ${vart_INCLUDE_DIRS}/vart/experimental
  ${vart_INCLUDE_DIRS}/vart/trace
  ${ENGINE_HDRS}
  ${RUNNER_HDRS}
  ${CONTROLLER_HDRS}
  ${DEVICE_HDRS}
  ${GLOG_INCLUDE_DIRS}
  ${JSONC_INCLUDE_DIRS}
  )

add_library(
  ${PROJECT_NAME}
  SHARED 
  ${ENGINE_SRCS}
  ${RUNNER_SRCS}
  ${DEVICE_SRCS}
  ${CONTROLLER_SRCS}
  )

option(LINK_HWEMU "Directly link xrt_hwemu" OFF)

option(LINK_SWEMU "Directly link xrt_swemu" OFF)

option(LINK_CORE "Directly link xrt_core" ON)

set(XRT_LINK_LIBS "XRT::xrt_coreutil")

if(LINK_HWEMU)
  message(STATUS "Will link xrt_hwemu library")
  list(APPEND XRT_LINK_LIBS XRT::xrt_hwemu)
elseif(LINK_SWEMU)
  message(STATUS "Will link xrt_swemu library")
  list(APPEND XRT_LINK_LIBS XRT::xrt_swemu)
elseif(LINK_CORE)
  message(STATUS "Will link xrt_core library")
  list(APPEND XRT_LINK_LIBS XRT::xrt_core)
endif()

target_link_libraries(
  ${PROJECT_NAME}
  PRIVATE
  ${XRT_LINK_LIBS}
  ${XRM_LIBRARIES}
  target-factory::target-factory 
  vart::runner
  vart::trace
  glog::glog
  ${JSONC_LIBRARIES}
  Threads::Threads
  Boost::boost
  )
set_target_properties(
  ${PROJECT_NAME}
  PROPERTIES
  INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/lib
  INSTALL_RPATH_USE_LINK_PATH TRUE
  )
install(
  TARGETS
  ${PROJECT_NAME}
  EXPORT ${PROJECT_NAME}-targets
  RUNTIME DESTINATION bin
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib)

if(BUILD_TESTS)
  enable_testing()
  add_subdirectory(tests)
endif()

include(helper)

if(UNIX)
  include(cpackLinux)
endif()
