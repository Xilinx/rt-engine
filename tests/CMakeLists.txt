
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
  COMPONENT base
  DESTINATION bin
  )
