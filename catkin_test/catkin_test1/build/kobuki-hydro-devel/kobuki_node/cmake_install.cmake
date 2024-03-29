# Install script for directory: /home/tmb/catkin_test/catkin_test1/src/kobuki-hydro-devel/kobuki_node

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/tmb/catkin_test/catkin_test1/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/build/kobuki-hydro-devel/kobuki_node/catkin_generated/installspace/kobuki_node.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_node/cmake" TYPE FILE FILES
    "/home/tmb/catkin_test/catkin_test1/build/kobuki-hydro-devel/kobuki_node/catkin_generated/installspace/kobuki_nodeConfig.cmake"
    "/home/tmb/catkin_test/catkin_test1/build/kobuki-hydro-devel/kobuki_node/catkin_generated/installspace/kobuki_nodeConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_node" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/src/kobuki-hydro-devel/kobuki_node/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kobuki_node" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/src/kobuki-hydro-devel/kobuki_node/include/kobuki_node/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_node" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/src/kobuki-hydro-devel/kobuki_node/plugins")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_node" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/src/kobuki-hydro-devel/kobuki_node/launch")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_node" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/src/kobuki-hydro-devel/kobuki_node/param")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/kobuki_node" TYPE PROGRAM FILES
    "/home/tmb/catkin_test/catkin_test1/src/kobuki-hydro-devel/kobuki_node/scripts/getOdom2D.py"
    "/home/tmb/catkin_test/catkin_test1/src/kobuki-hydro-devel/kobuki_node/scripts/getYaw.py"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/tmb/catkin_test/catkin_test1/build/kobuki-hydro-devel/kobuki_node/src/cmake_install.cmake")

endif()

