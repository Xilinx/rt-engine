
find_package(GTest REQUIRED)
find_package(OpenCV REQUIRED)
find_package(Boost COMPONENTS system filesystem REQUIRED)

include_directories(
  ${GTest_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
)

add_executable(
  run_rtengine_tests
  ${CMAKE_CURRENT_SOURCE_DIR}/common/Inference.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/common/cpuUtil.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/common/XirKeys.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/create_runners/test.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/inference/test.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/checker/test.cpp
  )

target_include_directories(
  run_rtengine_tests
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/common
  )

target_link_libraries(
  run_rtengine_tests
  PRIVATE
  ${PROJECT_NAME}
  opencv_core
  opencv_imgproc
  opencv_highgui
  opencv_imgcodecs
  ${Boost_SYSTEM_LIBRARY}
  ${Boost_FILESYSTEM_LIBRARY}
  ${JSONC_LIBRARIES}
  vart::runner
  xir::xir
  GTest::GTest
  GTest::Main
  stdc++fs
  )

set_target_properties(
  run_rtengine_tests
  PROPERTIES
  INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/lib
  INSTALL_RPATH_USE_LINK_PATH TRUE
  )

include(GoogleTest)
gtest_discover_tests(
  run_rtengine_tests
  )

install(
  TARGETS
  run_rtengine_tests
  EXPORT ${PROJECT_NAME}-targets
  DESTINATION bin
  )

set(TESTS "app" "dpuv3int8"  "engine"  "vart_dpuv3int8"  "vart_dpuv3me"  "vart_dpuv4e" "vart_dpuv3e" "vart_samples")
foreach(test ${TESTS})
  get_filename_component(exe ${test} NAME)
  file(GLOB_RECURSE TEST_SRCS "${exe}/*.cpp")
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
    stdc++fs
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
    DESTINATION bin
    )
endforeach()

