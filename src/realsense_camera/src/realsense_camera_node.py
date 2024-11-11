#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from delta_amr_service.srv import realsense_srv, realsense_srvResponse
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image
import os
import time

# Write a non-closing window display real-time image

class RealsenseCameraNode:
    def __init__(self):
        rospy.init_node('realsense_camera_node', anonymous=True)
        
        # 設定回應 'human_detect' 服務
        self.service = rospy.Service('realsense_srv', realsense_srv, self.human_detect_callback)
        
        rospy.loginfo("Realsense Camera Node initialized.")
        
        self.image_publisher = rospy.Publisher('/camera/image', Image, queue_size=10)
        self.bridge = CvBridge()
        
        # 圖像存儲路徑（可自定義）
        self.image_paths = ['/home/ctlee/catkin_ws/src/realsense_camera/src/cat1.jpg',
        '/home/ctlee/catkin_ws/src/realsense_camera/src/cat2.jpeg', '/home/ctlee/catkin_ws/src/realsense_camera/src/cat3.jpg']
        
    def human_detect_callback(self, req):
        rospy.loginfo(f"Received human detection request with process type: {req.img_process_type_realsense}")
        
        if req.img_process_type_realsense == 'human_detect':
               # 這裡進行人類偵測處理，可以根據需求進行影像處理或偵測（目前只是模擬）
               rospy.sleep(1)  # 模擬影像處理或偵測時間
               # 模擬偵測結果，假設返回偵測到的距離
               human_dist = 3.5  # 模擬距離值（單位：米）
               # 輸出結果訊息
               rospy.loginfo(f"Human detected at distance: {human_dist} meters.")
               # 返回處理結果（根據您的自定義服務返回的格式）
               return realsense_srvResponse(camera_status_realsense=0, human_dist=human_dist)
		
        elif req.img_process_type_realsense == 'take_pic':
            # 發送圖片（依序發送cat1.jpg, cat2.jpg, cat3.jpg）
            for image_path in self.image_paths:
                if os.path.exists(image_path):
                    image = cv2.imread(image_path)
                    image_message = self.bridge.cv2_to_imgmsg(image, encoding="bgr8")
                    self.image_publisher.publish(image_message)
                    rospy.loginfo(f"Published image from {image_path}")
                    rospy.sleep(1)  # 等待1秒發送下一張圖片
                else:
                    rospy.logwarn(f"Image {image_path} not found!")
            
            return realsense_srvResponse(camera_status_realsense=1, human_dist=0.0)

        else:
            rospy.logwarn("Unknown process type requested.")
            return realsense_srvResponse(camera_status_realsense=-1, human_dist=0.0)
		

if __name__ == '__main__':
    try:
        # 初始化RealsenseCameraNode並開始服務
        RealsenseCameraNode()
        rospy.spin()  # 保持服務運行，直到節點被中止
    except rospy.ROSInterruptException:
        pass

