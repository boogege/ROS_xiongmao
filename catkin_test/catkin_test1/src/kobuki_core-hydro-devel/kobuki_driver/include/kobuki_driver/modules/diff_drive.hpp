/**
 * @file /kobuki_driver/include/kobuki_driver/modules/diff_drive.hpp
 *
 * @brief Simple module for the diff drive odometry.
 *
 * License: BSD
 *   https://raw.github.com/yujinrobot/kobuki_core/hydro-devel/kobuki_driver/LICENSE
 **/
/*****************************************************************************
** Ifdefs
*****************************************************************************/

#ifndef KOBUKI_DIFF_DRIVE_HPP_
#define KOBUKI_DIFF_DRIVE_HPP_

/*****************************************************************************
** Includes
*****************************************************************************/

#include <vector>
#include <climits>
#include <stdint.h>
#include <ecl/mobile_robot.hpp>
#include <ecl/threads/mutex.hpp>
#include "../macros.hpp"

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace kobuki {

/*****************************************************************************
** Interfaces
*****************************************************************************/

class kobuki_PUBLIC DiffDrive {
public:
  DiffDrive();
 // const ecl::DifferentialDrive::Kinematics& kinematics() { return diff_drive_kinematics; }
  void update(const uint16_t &time_stamp,
              const uint16_t &left_wheel,
              const uint16_t &right_wheel,
              const uint16_t &back_wheel,
              ecl::LegacyPose2D<double> &pose_update,
              ecl::linear_algebra::Vector3d &pose_update_rates);
  void reset();

  void getWheelJointStates(double &wheel_left_s, double &wheel_left_cmd, 
			   double &wheel_right_s, double &wheel_right_cmd,
                           double &wheel_back_s, double &wheel_back_cmd);

  void setVelocityCommands(const double &vx, const double &vy, const double &wz);
  void velocityCommands(const double &vx, const double &vy, const double &wz);
  void velocityCommands(const short &cmd_speed, const short &cmd_radius);
  void velocityCommands(const std::vector<double> &cmd) { velocityCommands(cmd[0], cmd[1], cmd[2]); }
  void velocityCommands(const std::vector<short>  &cmd) { velocityCommands(cmd[0], cmd[1]); }

  /*********************
  ** Command Accessors
  **********************/
  std::vector<short> velocityCommands(); // (Vx, Vy, Wz), in [mm/s] [mm/s] [rad*1000/s]
  std::vector<double> pointVelocity() const; // (vx, wz), in [m/s] and [rad/s]

  /*********************
  ** Property Accessors
  **********************/
  double wheel_bias() const { return bias; }

private:
  unsigned short last_timestamp;
  double last_diff_time;
  double cmd_vel_scale;

  int16_t last_left_cmd, last_right_cmd,last_back_cmd;
  double last_left_s, last_right_s, last_back_s;
  double dx, dy, dw;

  //double v, w; // in [m/s] and [rad/s]
  std::vector<double> point_velocity; // (vx, wz), in [m/s] and [rad/s]
  double bias; //wheelbase, wheel_to_wheel, in [m]
  int imu_heading_offset;

//---------------three wheel robot cmd-------------------------//
  double Vx;     //(mm/s)
  double Vy;     //(mm/s)
  double Wz;     //(rad*1000/s)

 // ecl::DifferentialDrive::Kinematics diff_drive_kinematics;
  ecl::Mutex velocity_mutex, state_mutex;

  // Utility
  short bound(const double &value);
};

} // namespace kobuki

#endif /* KOBUKI_DIFF_DRIVE_HPP_ */
