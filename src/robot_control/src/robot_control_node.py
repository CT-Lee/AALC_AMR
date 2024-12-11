#!/usr/bin/env python3
import rospy
from delta_amr_service.srv import robot_control_srv, robot_control_srvResponse
from neurapy.robot import Robot
import numpy as np
# import ast

class RobotControlNode:
    def __init__(self):
        # 初始化ROS节点
        rospy.init_node('robot_control_node')
        
        # 创建NeuraPy的Robot实例
        
        
        # 设置服务
        self.service = rospy.Service('robot_control_srv', robot_control_srv, self.handle_robot_control)\
        # Create the following instance will automatically connect to the robot
        self.robot = Robot()
        rospy.loginfo("Robot Control Node initialized and service ready.")
        
        
        
    def handle_robot_control(self, req):
        # 提取请求参数
        robot_mov_type = req.robot_mov_type
        robot_mov_point = req.robot_mov_point
        robot_mov_speed = req.robot_mov_speed
        
        rospy.loginfo(f"Received request: mov_type={robot_mov_type}, mov_point={robot_mov_point}, speed={robot_mov_speed}")
        
        # 设置运动属性
        joint_property = {
            "speed": 25.0,
            "rotation_speed":25.0,
            "acceleration": 2,  # 默认加速度
            "non_blocking": True
        }

        try:
            if robot_mov_type == "MovL":
                # 将robot_mov_point字符串转换为列表
                # target_joint = ast.literal_eval(robot_mov_point)
                joint_property["target_pose"] = [robot_mov_point]
                self.robot.move_linear_from_current_position(**joint_property)
                rospy.loginfo("Joint move command executed.")
                return robot_control_srvResponse(robot_running_status = 'running')
            
            elif robot_mov_type == "MovP":
                Joint_data_now = self.robot.robot_status("jointAngles")
                Joint_data_target = self.robot.get_point(robot_mov_point,representation="Joint")
                print("Joint_data_now: ", Joint_data_now)
                print("Joint_data_target: ", Joint_data_target)
                joint_property["target_joint"] = [Joint_data_now, Joint_data_target]
                rospy.sleep(0.1)
                self.robot.move_joint(**joint_property)
                rospy.loginfo("Joint move command executed.")
                return robot_control_srvResponse(robot_running_status = 'running')
            
            elif robot_mov_type == "stop":
                self.robot.stop()
                print("Robot Stop")
                return robot_control_srvResponse(robot_running_status = 'stopped')
            
            elif robot_mov_type == "status":
                status = self.robot.motion_status()
                return robot_control_srvResponse(robot_running_status = status)
            
            elif robot_mov_type == "is_reached":
                # Return value is list
                Joint_data_target = self.robot.get_point(robot_mov_point,representation="Joint")
                Joint_data_now = self.robot.robot_status("jointAngles")
                error_sum = 0
                for i in range(6):
                    error_sum += np.abs(Joint_data_target[i] - Joint_data_now[i])
                # print("error_sum: ", error_sum)
                if error_sum < 0.001:
                    print("Reached!")
                    return robot_control_srvResponse(robot_running_status = 'reached')
                else:
                    return robot_control_srvResponse(robot_running_status = 'not_yet')

            else:
                rospy.logerr("Invalid robot_mov_type specified.")
                return robot_control_srvResponse(robot_running_status='error')  # 错误状态码

        except Exception as e:
            rospy.logerr(f"Error executing robot movement: {e}")
            # 返回错误状态码
            return robot_control_srvResponse(robot_running_status='error')

if __name__ == '__main__':
    try:
        RobotControlNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
