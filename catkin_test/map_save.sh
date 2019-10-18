#!/bin/bash
source /opt/ros/kinetic/setup.bash
int=1
while(( $int<=1000 ))
do
sleep 2
echo $int
rosrun map_server map_saver -f /home/tmb/catkin_test/map/map1
let "int++"
done
#kill -1 `ps -o ppid -p $$ | tail -1`
 
