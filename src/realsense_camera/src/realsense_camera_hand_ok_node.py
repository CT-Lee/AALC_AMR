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
import mediapipe as mp
import joblib

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
        self.config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)  # Color stream at 640x480 resolution
        # self.config.enable_stream(rs.stream.depth, 1280, 720, rs.format.z16, 30)  # Depth stream at 640x480 resolution
        self.pipeline.start(self.config)
        # 設定回應 'human_detect' 服務
        self.service = rospy.Service('realsense_srv', realsense_srv, self.camera_action_callback)
        self.target_process = ""

        # Initialize Mediapipe Hands module
        self.mp_hands = mp.solutions.hands
        self.hands = self.mp_hands.Hands(max_num_hands=5, min_detection_confidence=0.5, min_tracking_confidence=0.5)
        self.mp_drawing = mp.solutions.drawing_utils
        self.hand_ok = None
        self.matrices = []

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
        
        # Get the dimensions of the image
        height, width, channels = color_image.shape
        # Calculate the center of the image
        center_x, center_y = width // 2, height // 2
        # Define the size of the cropped region (640x640)
        crop_size = 500
        # Calculate the crop region based on the center
        x1 = center_x - crop_size // 2
        x2 = center_x + crop_size // 2
        y1 = center_y - crop_size // 2
        y2 = center_y + crop_size // 2
        # Ensure that the coordinates stay within the image bounds
        x1 = max(0, x1)
        x2 = min(width, x2)
        y1 = max(0, y1)
        y2 = min(height, y2)
        # Crop the image to the 640x640 region from the center
        color_image = color_image[y1:y2, x1:x2]

        rgb_image = cv2.cvtColor(color_image, cv2.COLOR_BGR2RGB)
        results = self.hands.process(rgb_image)

        if results.multi_hand_landmarks:
            for landmarks in results.multi_hand_landmarks:
                self.mp_drawing.draw_landmarks(color_image, landmarks, self.mp_hands.HAND_CONNECTIONS)
                landmarks_array = []
                for landmark in landmarks.landmark:
                    landmarks_array.append([landmark.x, landmark.y, landmark.z])
                landmarks_np = np.array(landmarks_array, dtype="O").flatten()
                test_data = np.array(landmarks_np).reshape(1, -1)
                #y_pred = svm_classifier.predict(test_data)
                y_pred = (svm_classifier.predict_proba(test_data)[:,1] <= 0.5).astype(bool) # set threshold as 0.3
                # Print the predictions
                print(f"Predictions: {y_pred}")
                
                if y_pred == True:
                    op = True
                    break
                else:
                    op = False
                    
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

