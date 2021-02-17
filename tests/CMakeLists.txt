
add_executable(
  run_tests
  ${CMAKE_CURRENT_SOURCE_DIR}/create_runners/test.cpp
  )

target_link_libraries(
  run_tests
  PRIVATE
  ${PROJECT_NAME}
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

