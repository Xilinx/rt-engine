#
# Copyright 2019 Xilinx Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
if(NOT CMAKE_CROSSCOMPILING)
  find_path(XRM_INCLUDE_DIRS
    NAMES xrm.h
    PATHS "/opt/xilinx/xrm/include"
    PATH_SUFFIXES xrm
    )

  find_library(XRM_LIBRARYIES
    NAMES xrm
    HINTS "/opt/xilinx/xrm/lib"
    )
else()
  find_path(XRM_INCLUDE_DIRS
    NAMES xrm.h
    PATH_SUFFIXES xrm
    )

  find_library(XRM_LIBRARYIES
    NAMES xrm
    )
endif(NOT CMAKE_CROSSCOMPILING)
set(XRM_VERSION "2.3.1301")
mark_as_advanced(XRM_FOUND XRM_CLOUD_FOUND XRM_EDGE_FOUND XRM_LIBRARYIES XRM_INCLUDE_DIRS XRM_VERSION)
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Xrm
    REQUIRED_VARS XRM_INCLUDE_DIRS XRM_LIBRARYIES
    VERSION_VAR XRM_VERSION
)

#if(XRM_FOUND AND NOT TARGET XRM::XRM)
#  add_library(XRM::XRM SHARED IMPORTED)
#  set_property(TARGET XRM::XRM PROPERTY IMPORTED_LOCATION  ${XRM_LIBRARYIES})
#  set_property(TARGET XRM::XRM APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${XRM_INCLUDE_DIRS})
#  get_filename_component(XRM_LIB_DIRECTORY ${XRM_LIBRARYIES} DIRECTORY)
#  set_property(TARGET XRM::XRM APPEND PROPERTY INTERFACE_LINK_DIRECTORIES ${XRM_LIB_DIRECTORY})
#  set_property(TARGET XRM::XRM APPEND PROPERTY INTERFACE_LINK_LIBRARIES -lxrm)
#endif()

if(CMAKE_CROSSCOMPILING)
  set(XRM_EDGE_FOUND true)
  set(XRM_CLOUD_FOUND false)
else()
  set(XRM_EDGE_FOUND false)
  set(XRM_CLOUD_FOUND true)
endif()
