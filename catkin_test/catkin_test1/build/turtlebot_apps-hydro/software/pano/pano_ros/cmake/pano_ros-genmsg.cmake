# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pano_ros: 15 messages, 0 services")

set(MSG_I_FLAGS "-Ipano_ros:/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg;-Ipano_ros:/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pano_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg" ""
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg" ""
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg" "actionlib_msgs/GoalID:pano_ros/StitchFeedback:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg" "actionlib_msgs/GoalID:pano_ros/PanoCaptureResult:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg" "pano_ros/PanoCaptureActionResult:pano_ros/PanoCaptureActionFeedback:pano_ros/PanoCaptureGoal:std_msgs/Header:pano_ros/PanoCaptureFeedback:pano_ros/PanoCaptureActionGoal:pano_ros/PanoCaptureResult:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg" "actionlib_msgs/GoalID:pano_ros/StitchGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg" "actionlib_msgs/GoalID:pano_ros/PanoCaptureFeedback:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg" "actionlib_msgs/GoalID:pano_ros/PanoCaptureGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg" ""
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg" ""
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg" "pano_ros/StitchFeedback:std_msgs/Header:pano_ros/StitchResult:pano_ros/StitchActionGoal:pano_ros/StitchActionResult:pano_ros/StitchGoal:actionlib_msgs/GoalID:pano_ros/StitchActionFeedback:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg" "sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg" ""
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg" "actionlib_msgs/GoalID:pano_ros/StitchResult:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg" NAME_WE)
add_custom_target(_pano_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pano_ros" "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg"
  "${MSG_I_FLAGS}"
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg"
  "${MSG_I_FLAGS}"
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)
_generate_msg_cpp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
)

### Generating Services

### Generating Module File
_generate_module_cpp(pano_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pano_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pano_ros_generate_messages pano_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_cpp _pano_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pano_ros_gencpp)
add_dependencies(pano_ros_gencpp pano_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pano_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg"
  "${MSG_I_FLAGS}"
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg"
  "${MSG_I_FLAGS}"
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)
_generate_msg_eus(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
)

### Generating Services

### Generating Module File
_generate_module_eus(pano_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pano_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pano_ros_generate_messages pano_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_eus _pano_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pano_ros_geneus)
add_dependencies(pano_ros_geneus pano_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pano_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg"
  "${MSG_I_FLAGS}"
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg"
  "${MSG_I_FLAGS}"
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)
_generate_msg_lisp(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
)

### Generating Services

### Generating Module File
_generate_module_lisp(pano_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pano_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pano_ros_generate_messages pano_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_lisp _pano_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pano_ros_genlisp)
add_dependencies(pano_ros_genlisp pano_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pano_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg"
  "${MSG_I_FLAGS}"
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg"
  "${MSG_I_FLAGS}"
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)
_generate_msg_nodejs(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
)

### Generating Services

### Generating Module File
_generate_module_nodejs(pano_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pano_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pano_ros_generate_messages pano_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_nodejs _pano_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pano_ros_gennodejs)
add_dependencies(pano_ros_gennodejs pano_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pano_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg"
  "${MSG_I_FLAGS}"
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg"
  "${MSG_I_FLAGS}"
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)
_generate_msg_py(pano_ros
  "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
)

### Generating Services

### Generating Module File
_generate_module_py(pano_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pano_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pano_ros_generate_messages pano_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg" NAME_WE)
add_dependencies(pano_ros_generate_messages_py _pano_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pano_ros_genpy)
add_dependencies(pano_ros_genpy pano_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pano_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pano_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(pano_ros_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pano_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(pano_ros_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pano_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(pano_ros_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pano_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(pano_ros_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pano_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(pano_ros_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pano_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(pano_ros_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pano_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(pano_ros_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pano_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(pano_ros_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pano_ros/.+/__init__.pyc?$"
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(pano_ros_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pano_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(pano_ros_generate_messages_py sensor_msgs_generate_messages_py)
endif()
