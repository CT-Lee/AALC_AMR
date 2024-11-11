#!/usr/bin/env python3
import rospy
from delta_amr_service.srv import robot_control_srv, robot_control_srvResponse
from neurapy.robot import Robot
# import ast

class RobotControlNode:
    def __init__(self):
        # 初始化ROS节点
        rospy.init_node('robot_control_node')
        
        # 创建NeuraPy的Robot实例
        
        
        # 设置服务
        self.service = rospy.Service('robot_control_srv', robot_control_srv, self.handle_robot_control)
        
        rospy.loginfo("Robot Control Node initialized and service ready.")
        # Create the following instance will automatically connect to the robot
        #self.robot = Robot()
        
    def handle_robot_control(self, req):
        # 提取请求参数
        robot_mov_type = req.robot_mov_type
        robot_mov_point = req.robot_mov_point
        robot_mov_speed = req.robot_mov_speed
        
        rospy.loginfo(f"Received request: mov_type={robot_mov_type}, mov_point={robot_mov_point}, speed={robot_mov_speed}")
        
        # 设置运动属性
        joint_property = {
            "speed": robot_mov_speed,
            "acceleration": 0.1,  # 默认加速度
        }

        try:
            if robot_mov_type == "MovL":
                # 将robot_mov_point字符串转换为列表
                # target_joint = ast.literal_eval(robot_mov_point)
                joint_property["target_joint"] = [robot_mov_point]
                #self.robot.move_joint(**joint_property)
                rospy.loginfo("Joint move command executed.")
                #self.robot.stop()
            #elif robot_mov_type == "MovL":
                # 将robot_mov_point字符串转换为列表
                #target_pose = ast.literal_eval(robot_mov_point)
                #self.robot.move_pose(pose=target_pose, speed=robot_mov_speed)
                #rospy.loginfo("Pose move command executed.")
            
            else:
                rospy.logerr("Invalid robot_mov_type specified.")
                return robot_control_srvResponse(robot_running_status=-1)  # 错误状态码

            # 成功执行操作后，返回状态码0
            return robot_control_srvResponse(robot_running_status=0)
        
        except Exception as e:
            rospy.logerr(f"Error executing robot movement: {e}")
            # 返回错误状态码
            return robot_control_srvResponse(robot_running_status=-1)

if __name__ == '__main__':
    try:
        RobotControlNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
