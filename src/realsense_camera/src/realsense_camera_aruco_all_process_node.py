#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from delta_amr_service.srv import realsense_srv, realsense_srvResponse
import cv2
import os
import time
import uuid
import pyrealsense2 as rs
import numpy as np
import joblib
import cv2.aruco as aruco

# Load the saved SVM model using pickle
script_path = os.path.dirname(__file__)
svm_classifier = joblib.load(script_path + '/svm_model_prob.pkl')
print("load model success")

class RealsenseCameraNode:
    def __init__(self):
        rospy.init_node('realsense_camera_node', anonymous=True)
        # setup realsense
        # self.bag = 'realsense_1124.bag'
        self.pipeline = rs.pipeline()
        self.config = rs.config()
        #config.enable_device_from_file(bag_file)# for bag testing
        self.config.enable_stream(rs.stream.color, 1280, 720, rs.format.bgr8, 30)  # Color stream at 640x480 resolution
        # self.config.enable_stream(rs.stream.depth, 1280, 720, rs.format.z16, 30)  # Depth stream at 640x480 resolution
        self.pipeline.start(self.config)
        # 設定回應 'human_detect' 服務
        self.service = rospy.Service('realsense_srv', realsense_srv, self.camera_action_callback)
        self.target_process = ""

        # 定義 ArUco 標籤的字典
        # self.aruco_dict = aruco.Dictionary_get(aruco.DICT_6X6_250)
        self.aruco_dict = cv2.aruco.getPredefinedDictionary(cv2.aruco.DICT_6X6_250)
        # 初始化 ArUco 標籤檢測參數
        self.parameters = cv2.aruco.DetectorParameters()

        # 圖像存儲路徑（可自定義）
        self.absolute_path = os.path.dirname(__file__)
        self.relative_path = "data_upload_node/realsense_imgs"
        self.ftp_dir = os.path.join(self.absolute_path[:-21], self.relative_path)# Remote directory for image upload
        rospy.loginfo("Realsense Camera Node initialized.")

    def camera_action_callback(self, req):
        rospy.loginfo(f"Received human detection request with process type: {req.img_process_type_realsense}")
        
        if req.img_process_type_realsense == 'human_detect':
               op = self.hand_pose_detection()
               return realsense_srvResponse(target_process = self.target_process, execute_bool = op)
		
        elif req.img_process_type_realsense == 'A01' or req.img_process_type_realsense == 'A02' or req.img_process_type_realsense == 'A03':
            self.target_process = req.img_process_type_realsense
            self.take_pic()
            print("realsense take pic!!!")
            return realsense_srvResponse(target_process = self.target_process, execute_bool = False)

        else:
            rospy.logwarn("Unknown process type requested.")
            return realsense_srvResponse(target_process = "invalid srv callback", execute_bool = False)
        
    def hand_pose_detection(self):
        op = False
        self.target_process = ""
        
        while True:
            #print("Taking frame")
            frames = self.pipeline.wait_for_frames()
            color_frame = frames.get_color_frame()
            if color_frame:
                break
        
        # Convert the aligned frames to numpy arrays
        color_image = np.asanyarray(color_frame.get_data())
        gray = cv2.cvtColor(color_image, cv2.COLOR_BGR2GRAY)

        # 檢測 ArUco 標籤
        corners, ids, rejectedImgPoints = aruco.detectMarkers(gray, self.aruco_dict, parameters=self.parameters)

        # 如果檢測到 ArUco 標籤
        if ids is not None:
            for i, id in enumerate(ids):
                if id[0] == 1:  # 檢測到 ID 為 1 的標籤
                    print("detect_target_process_A01")
                    self.target_process = "A01"
                    op = True
                else:
                    print("invalid_target_process!!!")
                    
        return op

    def take_pic(self):
        while True:
            # Wait for a frame
            frames = self.pipeline.wait_for_frames()
            # Align the depth frame to the color frame
            color_frame = frames.get_color_frame()
            if color_frame:
                color_image = np.asanyarray(color_frame.get_data())
                break
        
        filename = os.path.join(self.ftp_dir, self.target_process + str(uuid.uuid4()) + '_color.png')
        cv2.imwrite(filename, color_image, [cv2.IMWRITE_PNG_COMPRESSION, 5])
        rospy.loginfo(f"Image saved to temporary file: {filename}")
        return 0

if __name__ == '__main__':
    try:
        # Initialize node and service
        node = RealsenseCameraNode()
        rospy.spin()  # Keep the node running
    except rospy.ROSInterruptException:
        pass

