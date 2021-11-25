
include(CMakePackageConfigHelpers)

configure_file (
  ${PROJECT_SOURCE_DIR}/cmake/config.in
  ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config.cmake
  @ONLY
  )
write_basic_package_version_file (
  ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY AnyNewerVersion
  )
install (
  FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config.cmake ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
  COMPONENT base
  DESTINATION share/cmake/${PROJECT_NAME}
  )
install(
  EXPORT ${PROJECT_NAME}-targets
  NAMESPACE ${PROJECT_NAME}::
  COMPONENT base
  DESTINATION share/cmake/${PROJECT_NAME}
  )
