#!/usr/bin/env python3
import rospy
from std_msgs.msg import String

class RealsenseCameraNode:
    def __init__(self):
        rospy.init_node('realsense_camera_node')
        
        # 設定接收命令的Subscriber
        rospy.Subscriber('/realsense_camera/command', String, self.command_callback)
        
        # 設定回應命令的Publisher
        self.response_pub = rospy.Publisher('/realsense_camera/response', String, queue_size=10)
        
        rospy.loginfo("Realsense Camera Node initialized.")

    def command_callback(self, msg):
        rospy.loginfo(f"Received command from state machine: {msg.data}")
        
        # 進行拍照及影像後處理（這裡只是模擬）
        if msg.data == "capture_image":
            rospy.loginfo("Capturing image...")
            rospy.sleep(1)  # 模擬拍照處理時間
            rospy.loginfo("Image captured and processed.")

            # 發送回應
            self.response_pub.publish("image_captured")

if __name__ == '__main__':
    try:
        RealsenseCameraNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
