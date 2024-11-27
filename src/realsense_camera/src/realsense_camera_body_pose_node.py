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
import open3d as o3d
import mediapipe as mp

# Write a non-closing window display real-time image
# 計算歐幾里得距離
def calculate_distance(pt1, pt2):
    return np.sqrt((pt1[0] - pt2[0])**2 + (pt1[1] - pt2[1])**2)

# 手勢檢測
def check_gesture(left_shoulder, left_elbow, left_wrist, 
                  right_shoulder, right_elbow, right_wrist, 
                  x_factor, y_factor):
    # 條件 1: 手肘高於肩膀
    elbows_higher = (
        left_elbow[1] < left_shoulder[1] and right_elbow[1] < right_shoulder[1]
    )

    # 條件 2: 左右手肘距離 > 左右肩膀距離的 x 倍
    shoulder_distance = abs(left_shoulder[0] - right_shoulder[0])
    elbow_distance = abs(left_elbow[0] - right_elbow[0])
    elbows_wider = elbow_distance > x_factor * shoulder_distance
    print("shoulder_distance: ", shoulder_distance)
    print("elbow_distance: ", elbow_distance)
    
    # 條件 3: 左右手腕距離 < 左右肩膀距離的 y 倍
    wrist_distance = calculate_distance(left_wrist, right_wrist)
    wrists_closer = wrist_distance < y_factor * shoulder_distance
    print("wrist_distance: ", wrist_distance)
    return elbows_higher and elbows_wider and wrists_closer

class RealsenseCameraNode:
    def __init__(self):
        rospy.init_node('realsense_camera_node', anonymous=True)
        
        # 設定回應 'human_detect' 服務
        self.service = rospy.Service('realsense_srv', realsense_srv, self.camera_action_callback)
        
        rospy.loginfo("Realsense Camera Node initialized.")

        # setup realsense
        self.bag = 'realsense_1124.bag'
        self.pipeline = rs.pipeline()
        self.config = rs.config()
        #config.enable_device_from_file(bag_file)# for bag testing
        self.config.enable_stream(rs.stream.color, 1280, 720, rs.format.bgr8, 30)  # Color stream at 640x480 resolution
        self.config.enable_stream(rs.stream.depth, 1280, 720, rs.format.z16, 30)  # Depth stream at 640x480 resolution
        self.pipeline.start(self.config)
        self.align_to = rs.stream.color
        self.align = rs.align(self.align_to)
        self.pc = rs.pointcloud()
        self.count = 1

        # Initialize Mediapipe Hands module
        # self.mp_hands = mp.solutions.hands
        self.mp_pose = mp.solutions.pose
        #self.hands = self.mp_hands.Hands(max_num_hands=1, min_detection_confidence=0.5, min_tracking_confidence=0.5)
        self.pose = self.mp_pose.Pose(static_image_mode=False, model_complexity=1, enable_segmentation=False, min_detection_confidence=0.5)
        self.mp_drawing = mp.solutions.drawing_utils
        self.hand_ok = None
        self.matrices = []

        self.x_factor = 1.5
        self.y_factor = 0.85
        # 圖像存儲路徑（可自定義）
        self.absolute_path = os.path.dirname(__file__)
        self.relative_path = "data_upload_node/realsense_imgs"
        self.ftp_dir = os.path.join(self.absolute_path[:-21], self.relative_path)# Remote directory for image upload
        
    def camera_action_callback(self, req):
        rospy.loginfo(f"Received human detection request with process type: {req.img_process_type_realsense}")
        
        if req.img_process_type_realsense == 'human_detect':
               op = self.hand_pose_detection()
               return realsense_srvResponse(camera_status_realsense=0, human_dist=op)
		
        elif req.img_process_type_realsense == 'take_pic':
            self.take_pic()
            print("realsense take pic!!!")
            return realsense_srvResponse(camera_status_realsense=1, human_dist=0.0)

        else:
            rospy.logwarn("Unknown process type requested.")
            return realsense_srvResponse(camera_status_realsense=-1, human_dist=0.0)
        
    def hand_pose_detection(self):
        while True:
            # Wait for a frame
            frames = self.pipeline.wait_for_frames(	timeout_ms = 50000)
            # Align the depth frame to the color frame
            aligned_frames = self.align.process(frames)
            # Get aligned frames
            aligned_depth_frame = aligned_frames.get_depth_frame()
            color_frame = aligned_frames.get_color_frame()
            if aligned_depth_frame and color_frame:
                break
        # Convert the aligned frames to numpy arrays
        color_image = np.asanyarray(color_frame.get_data())
        aligned_depth_image = np.asanyarray(aligned_depth_frame.get_data())
        
        # Save the images
        #cv2.imwrite('Aligned RealSense'+str(self.count)+'.png', aligned_depth_image, [cv2.IMWRITE_PNG_COMPRESSION, 5])
        
        # hand pose estimation with mediapipe
        # color_image = cv2.resize(color_image, (640, 480), interpolation=cv2.INTER_CUBIC)
        # color_image = cv2.flip(color_image, 1)
        rgb_image = cv2.cvtColor(color_image, cv2.COLOR_BGR2RGB)
        results = self.pose.process(rgb_image)
        op = 1
        if results.pose_landmarks:
            landmarks = results.pose_landmarks.landmark

            # 提取標準化座標
            left_shoulder = (landmarks[self.mp_pose.PoseLandmark.LEFT_SHOULDER].x,
                            landmarks[self.mp_pose.PoseLandmark.LEFT_SHOULDER].y)
            left_elbow = (landmarks[self.mp_pose.PoseLandmark.LEFT_ELBOW].x,
                        landmarks[self.mp_pose.PoseLandmark.LEFT_ELBOW].y)
            left_wrist = (landmarks[self.mp_pose.PoseLandmark.LEFT_WRIST].x,
                        landmarks[self.mp_pose.PoseLandmark.LEFT_WRIST].y)
            right_shoulder = (landmarks[self.mp_pose.PoseLandmark.RIGHT_SHOULDER].x,
                            landmarks[self.mp_pose.PoseLandmark.RIGHT_SHOULDER].y)
            right_elbow = (landmarks[self.mp_pose.PoseLandmark.RIGHT_ELBOW].x,
                        landmarks[self.mp_pose.PoseLandmark.RIGHT_ELBOW].y)
            right_wrist = (landmarks[self.mp_pose.PoseLandmark.RIGHT_WRIST].x,
                        landmarks[self.mp_pose.PoseLandmark.RIGHT_WRIST].y)

            # 檢查條件
            if check_gesture(left_shoulder, left_elbow, left_wrist, 
                            right_shoulder, right_elbow, right_wrist, 
                            self.x_factor, self.y_factor):
                # cv2.putText(color_image, "Gesture Detected!", (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
                print("Gesture Detected!")
                op = 0
            else:
                op = 1
        '''
        hand_arr = []
        op = 1
        if results.multi_hand_landmarks:
            for hand_landmarks in results.multi_hand_landmarks:
                # Draw the hand landmarks
                self.mp_drawing.draw_landmarks(color_image, hand_landmarks, self.mp_hands.HAND_CONNECTIONS)
                for landmark in hand_landmarks.landmark:
                    hand_pts = [round(landmark.x, 2), round(landmark.y, 2), round(landmark.z, 2)]
                    hand_arr.append(hand_pts)
            hand_arr = np.array(hand_arr)
            score = np.linalg.norm(hand_arr - hand_ok, 'fro')
            print(score)
            if score < 1.5:
                print("ok_hand!!!!")
                op = 0
            else:
                op = 1
        '''
        return op

    def take_pic(self):
        while True:
            # Wait for a frame
            frames = self.pipeline.wait_for_frames(timeout_ms = 50000)
            # Align the depth frame to the color frame
            color_frame = frames.get_color_frame()
            if color_frame:
                color_image = np.asanyarray(color_frame.get_data())
                break
        
        filename = os.path.join(self.ftp_dir, str(uuid.uuid4()) + '_color.png')
        cv2.imwrite(filename, color_image, [cv2.IMWRITE_PNG_COMPRESSION, 5])
        rospy.loginfo(f"Image saved to temporary file: {filename}")
        return 0
		

if __name__ == '__main__':
    try:
        # 初始化RealsenseCameraNode並開始服務
        RealsenseCameraNode()
        rospy.spin()  # 保持服務運行，直到節點被中止
    except rospy.ROSInterruptException:
        pass

