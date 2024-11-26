#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from delta_amr_service.srv import amr_srv, amr_srvResponse
import os
import time

class OpenLoopControllerNode:
    def __init__(self):
        rospy.init_node('open_loop_motor_control_node', anonymous=True)
        self.service = rospy.Service('amr_srv', amr_srv, self.state_machine_srv_callback)
        self.pub_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=10)

        self.amr_status = 'stop'
        
        rospy.loginfo("Open Loop Motor Control Node initialized.")

    def pub_cmd_vel(self, vel_x):
        velocity_msg = Twist()
        velocity_msg.linear.x = vel_x
        rate = rospy.Rate(10)
        start_time = rospy.get_time()
        while rospy.get_time() - start_time < 3.0:
            self.pub_vel.publish(velocity_msg)
            rate.sleep()
        stop_msg = Twist()  # Empty message to stop the robot
        self.pub_vel.publish(stop_msg)
        return None

    def state_machine_srv_callback(self, req):
        if req.move_act == 'forward':
            self.amr_status = 'moving'
            self.pub_cmd_vel(-0.1)
            self.amr_status = 'stop'
            return amr_srvResponse(amr_status = self.amr_status)

        elif req.move_act == 'backward':
            self.amr_status = 'moving'
            self.pub_cmd_vel(0.1)
            self.amr_status = 'stop'
            return amr_srvResponse(amr_status = self.amr_status)

        else:
            rospy.logwarn("Unknown process type requested.")
            return amr_srvResponse(amr_status = self.amr_status)

if __name__ == '__main__':
    try:
        OpenLoopControllerNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass