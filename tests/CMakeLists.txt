
add_executable(
  run_tests
  ${CMAKE_CURRENT_SOURCE_DIR}/common/Inference.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/common/cpuUtil.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/common/XirKeys.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/create_runners/test.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/inference/test.cpp
  )

target_include_directories(
  run_tests
  PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/common
  )

target_link_libraries(
  run_tests
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

include(GoogleTest)
gtest_discover_tests(
  run_tests
  )
