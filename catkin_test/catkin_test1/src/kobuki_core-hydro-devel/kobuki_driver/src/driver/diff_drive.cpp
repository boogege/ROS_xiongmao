/**
 * @file /kobuki_driver/src/driver/diff_drive.cpp
 *
 * @brief Differential drive abstraction (brought in from ycs).
 *
 * License: BSD
 *   https://raw.github.com/yujinrobot/kobuki_core/hydro-devel/kobuki_driver/LICENSE
 **/

/*****************************************************************************
** Includes
*****************************************************************************/

#include "../../include/kobuki_driver/modules/diff_drive.hpp"
#include <fstream>
#include <ros/ros.h>
/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace kobuki {

/*****************************************************************************
** Implementation
*****************************************************************************/
DiffDrive::DiffDrive() :
  last_left_cmd(0),
  last_right_cmd(0),
  last_back_cmd(0),
  last_left_s(0.0),
  last_right_s(0.0),
  last_back_s(0.0),
  last_timestamp(0),
  dx(0.0),
  dy(0.0),
  dw(0.0),
  Vx(0.0), Vy(0.0), Wz(0.0),
  point_velocity(3,0.0), // command velocities, in [m/s] and [rad/s]
  bias(0.26)  // wheelbase, wheel_to_wheel, in [m]
{
  ros::param::get("cmd_vel_scale",cmd_vel_scale);
}

/**
 * @brief Updates the odometry from firmware stamps and encoders.
 *
 * Really horrible - could do with an overhaul.
 *
 * @param time_stamp
 * @param left_encoder
 * @param right_encoder
 * @param pose_update
 * @param pose_update_rates
 */
void DiffDrive::update(const uint16_t &time_stamp,
                       const uint16_t &left_wheel,
                       const uint16_t &right_wheel,
                       const uint16_t &back_wheel,
                       ecl::LegacyPose2D<double> &pose_update,
                       ecl::linear_algebra::Vector3d &pose_update_rates) {
  state_mutex.lock();
  static bool init = false;
  int16_t q2 = 0;
  int16_t q1 = 0;
  int16_t q3 = 0;
  uint16_t curr_timestamp = 0;
  double x_cmd = 0.0, y_cmd = 0.0, w_cmd = 0.0;
  curr_timestamp = time_stamp;
//  q2 = ((int16_t)left_wheel)*0.93;
//  q1 = ((int16_t)right_wheel)*0.93;
//  q3 = ((int16_t)back_wheel)*0.93;

  q2 = ((int16_t)left_wheel)*cmd_vel_scale;
  q1 = ((int16_t)right_wheel)*cmd_vel_scale;
  q3 = ((int16_t)back_wheel)*cmd_vel_scale;
 // ROS_ERROR("cmd_vel_scale:%f",cmd_vel_scale);

  if (!init)
  {
    last_left_cmd = q2;
    last_right_cmd = q1;
    last_back_cmd = q3;
    init = true;
  }
  x_cmd = (1.0/sqrt(3.0))*((last_right_cmd + q1)/2.0 - (last_left_cmd + q2)/2.0)/1000.0;
  y_cmd = (1.0/3)*((last_right_cmd + q1)/2.0 + (last_left_cmd + q2)/2.0 - (last_back_cmd + q3))/1000.0;
  w_cmd = (1.0/(3*bias))*((last_right_cmd + q1)/2.0 + (last_left_cmd + q2)/2.0 + (last_back_cmd + q3)/2.0)/1000.0;

  last_left_cmd = q2;
  last_right_cmd = q1;
  last_back_cmd = q3;
 
  if (curr_timestamp > last_timestamp)
  {
    last_diff_time = ((double)(uint16_t)((curr_timestamp - last_timestamp) & 0xffff)) / 1000000.0f;
    last_timestamp = curr_timestamp;
  } else {
    last_diff_time = ((double)(uint16_t)((curr_timestamp + 65536 - last_timestamp) & 0xffff)) / 1000000.0f;
    last_timestamp = curr_timestamp;
    // we need to set the last_velocity_xxx to zero?
  }
  dx = x_cmd * last_diff_time;
  dy = y_cmd * last_diff_time;
  dw = w_cmd * last_diff_time;

  last_left_s += dx;
  last_right_s += dy;
  last_back_s += dw;
//  printf("%f,%f,%f",dx,dy,dw); 
//std::ofstream fout("/home/jie/output.txt",std::ofstream::out | std::ofstream::app);
//fout <<"x_cmd y_cmd w_cmd:"<<x_cmd << " "<<y_cmd<<" "<< w_cmd <<" "<<last_diff_time<<" "<<curr_timestamp<<std::endl;
//fout <<"dx dy and dw:"<<dx << " "<<dy<<" "<< dw <<" "<<last_diff_time<<" "<<curr_timestamp<<std::endl;
//fout << "wheel speed q1 q2 q3:"<<q1 << " "<<q2<<" "<< q3 <<std::endl;
//fout.close();
//ROS_ERROR("last_diff_time:%f",last_diff_time);
//std::cout<<"test"<<std::endl;
  pose_update.translation(dx,dy);
  pose_update.rotation(dw);
  pose_update_rates << x_cmd,
                       y_cmd,
                       w_cmd;
  state_mutex.unlock();
}

void DiffDrive::reset() {
  state_mutex.lock();
  last_left_cmd = 0;
  last_right_cmd = 0;
  last_back_cmd = 0;
  last_left_s = 0.0;
  last_right_s = 0.0;
  last_back_s = 0.0;  
  state_mutex.unlock();
}

void DiffDrive::getWheelJointStates(double &wheel_left_s, double &wheel_left_cmd, 
			  	    double &wheel_right_s, double &wheel_right_cmd,
                           	    double &wheel_back_s, double &wheel_back_cmd){
  state_mutex.lock();
  wheel_left_s = last_left_s;
  wheel_left_cmd = last_left_cmd;
  wheel_right_s = last_right_s;
  wheel_right_cmd = last_right_cmd;
  wheel_back_s = last_back_s;
  wheel_back_cmd = last_back_cmd;
  state_mutex.unlock();
}

void DiffDrive::setVelocityCommands(const double &vx, const double &vy, const double &wz) {
  // vx: in m/s
  // vy: in m/s
  // wz: in rad/s
  std::vector<double> cmd_vel;
  cmd_vel.push_back(vx);
  cmd_vel.push_back(vy);
  cmd_vel.push_back(wz);
  point_velocity = cmd_vel;
}

/*
void DiffDrive::velocityCommands(const double &vx, const double &wz) {
  // vx: in m/s
  // wz: in rad/s
  velocity_mutex.lock();
  const double epsilon = 0.0001;

  // Special Case #1 : Straight Run
  if( std::abs(wz) < epsilon ) {
    radius = 0.0f;
    speed  = 1000.0f * vx;
    velocity_mutex.unlock();
    return;
  }

  radius = vx * 1000.0f / wz;
  // Special Case #2 : Pure Rotation or Radius is less than or equal to 1.0 mm
  if( std::abs(vx) < epsilon || std::abs(radius) <= 1.0f ) {
    speed  = 1000.0f * bias * wz / 2.0f;
    radius = 1.0f;
    velocity_mutex.unlock();
    return;
  }

  // General Case :
  if( radius > 0.0f ) {
    speed  = (radius + 1000.0f * bias / 2.0f) * wz;
  } else {
    speed  = (radius - 1000.0f * bias / 2.0f) * wz;
  }
  velocity_mutex.unlock();
  return;
}
*/

void DiffDrive::velocityCommands(const double &vx, const double &vy, const double &wz) {
  // vx: in m/s
  // wz: in rad/s
  velocity_mutex.lock();

  Vx = vx*1000;
  Vy = vy*1000;
  Wz = wz*1000;  

  velocity_mutex.unlock();
  return;
}

/*void DiffDrive::velocityCommands(const short &cmd_speed, const short &cmd_radius) {
  velocity_mutex.lock();
  speed = static_cast<double>(cmd_speed);   // In [mm/s]
  radius = static_cast<double>(cmd_radius); // In [mm]
  velocity_mutex.unlock();
  return;
}*/

std::vector<short> DiffDrive::velocityCommands() {
  velocity_mutex.lock();
  std::vector<short> cmd(3);
  cmd[0] = bound(Vx);  // In [mm/s]
  cmd[1] = bound(Vy); // In [mm]
  cmd[2] = bound(Wz);
  velocity_mutex.unlock();
  return cmd;
}

std::vector<double> DiffDrive::pointVelocity() const {
 // std::vector<double> cmd_vel;
 // cmd_vel.push_back(0.5);
 // cmd_vel.push_back(0.0);
 // cmd_vel.push_back(0.0);
 // return cmd_vel;
  return point_velocity;
}

short DiffDrive::bound(const double &value) {
  if (value > static_cast<double>(SHRT_MAX)) return SHRT_MAX;
  if (value < static_cast<double>(SHRT_MIN)) return SHRT_MIN;
  return static_cast<short>(value);
}

} // namespace kobuki
