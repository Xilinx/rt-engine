include(CPackComponent)

SET(CPACK_GENERATOR WIX)

set(CPACK_PACKAGE_NAME VitisAI)
set(CPACK_PACKAGE_VERSION_MAJOR ${CMAKE_PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${CMAKE_PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${CMAKE_PROJECT_VERSION_PATCH})
SET(CPACK_PACKAGE_VENDOR "Xilinx Inc")
SET(CPACK_PACKAGE_CONTACT "aaron.ng@xilinx.com")
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Vitis-AI Runtime Libraries")

# Need to have an extention
file(COPY "${PROJECT_SOURCE_DIR}/LICENSE" DESTINATION "${PROJECT_BINARY_DIR}")
file(RENAME "${PROJECT_BINARY_DIR}/LICENSE" "${PROJECT_BINARY_DIR}/license.txt")
SET(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_BINARY_DIR}/license.txt")

# --- Include supporting runtime libraries ---
set(CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_SKIP TRUE)
include(InstallRequiredSystemLibraries)
install(FILES ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS}
        DESTINATION bin
        COMPONENT runtime_libraries)

cpack_add_component(runtime_libraries
  DISPLAY_NAME "Visual Studio Runtime Libraries"
  DESCRIPTION "Visual Studio Runtime Libraries for running Xilinx applications."
  GROUP THIRD_PARTY_LIBRARIES
  ENABLED
)

# -- Boost shared libraries --
find_package(Boost REQUIRED COMPONENTS system filesystem)
file(GLOB BOOST_DLL_LIB_FILES
  "${Boost_LIBRARY_DIRS}/libboost_system*.lib"
  "${Boost_LIBRARY_DIRS}/libboost_filesystem*.lib"
  )

install(FILES ${BOOST_DLL_LIB_FILES}
        DESTINATION lib
        COMPONENT boost_libraries)

cpack_add_component(boost_libraries
  DISPLAY_NAME "Boost Runtime Libraries"
  DESCRIPTION "Boost runtime libraries used by Vitis-AI applications."
  GROUP THIRD_PARTY_LIBRARIES
  ENABLED
)

# -- Protobuf shared libraries --
find_package(Protobuf REQUIRED)
file(GLOB PROTOBUF_LIB_FILES
  "${Protobuf_LIBRARIES}"
  )
file(GLOB PROTOBUF_DLL_FILES
  "${Protobuf_INCLUDE_DIRS}/../bin/libprotobuf.dll"
  )

install(FILES ${PROTOBUF_LIB_FILES}
        DESTINATION lib
        COMPONENT protobuf_libraries)

install(FILES ${PROTOBUF_DLL_FILES}
        DESTINATION bin
        COMPONENT protobuf_libraries)

cpack_add_component(protobuf_libraries
  DISPLAY_NAME "Protobuf Runtime Libraries"
  DESCRIPTION "Protobuf runtime libraries used by Vitis-AI applications."
  GROUP THIRD_PARTY_LIBRARIES
  ENABLED
)

# -- Label the third party libraries group --
cpack_add_component_group(THIRD_PARTY_LIBRARIES
  DISPLAY_NAME "Third Party Libraries"
  DESCRIPTION "Third party libraries used by Vitis-AI applications."
)

# -- Our application ---
cpack_add_component(vairt
  DISPLAY_NAME "VAI-RT"
  DESCRIPTION "Vitis-AI Runtime and supporting libraries."
  REQUIRED
)

# Set the Packaging directory
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "Phoenix")
SET(CPACK_WIX_SKIP_PROGRAM_FOLDER TRUE)
SET(CPACK_WIX_UI_BANNER "${CMAKE_SOURCE_DIR}/cmake/XilinxBanner.bmp")
SET(CPACK_WIX_UI_DIALOG "${CMAKE_SOURCE_DIR}/cmake/XilinxDialog.bmp")

include(CPack)
