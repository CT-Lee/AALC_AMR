#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from delta_amr_service.srv import realsense_srv, realsense_srvResponse
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image
import os
import time
import pyrealsense2 as rs
import numpy as np
import open3d as o3d
import mediapipe as mp

hand_ok = np.array([[ 0.4999115   0.69265487  0],
            [ 0.42336283  0.67168142 -0.01973451],
            [ 0.35884956  0.63840708 -0.04628319],
            [ 0.30504425  0.62955752 -0.07628319],
            [ 0.26345133  0.6079646  -0.10681416],
            [ 0.39123894  0.47345133 -0.03283186],
 [ 0.32663717  0.46176991 -0.0860177 ],
 [ 0.29716814  0.52451327 -0.13256637],
 [ 0.28442478  0.58300885 -0.15858407],
 [ 0.42026549  0.44938053 -0.04920354],
 [ 0.37362832  0.34964602 -0.08716814],
 [ 0.33230088  0.28663717 -0.12079646],
 [ 0.29424779  0.23123894 -0.14486726],
 [ 0.45964602  0.4579646  -0.06929204],
 [ 0.44176991  0.35026549 -0.10442478],
 [ 0.41610619  0.28699115 -0.1280531 ],
 [ 0.38584071  0.2319469  -0.14353982],
 [ 0.49867257  0.49460177 -0.09035398],
 [ 0.51168142  0.4140708  -0.11469027],
 [ 0.50814159  0.35477876 -0.12079646],
 [ 0.49707965  0.29840708 -0.12486726]])

# Write a non-closing window display real-time image

class RealsenseCameraNode:
    def __init__(self):
        rospy.init_node('realsense_camera_node', anonymous=True)
        
        # 設定回應 'human_detect' 服務
        self.service = rospy.Service('realsense_srv', realsense_srv, self.camera_action_callback)
        
        rospy.loginfo("Realsense Camera Node initialized.")
        
        self.image_publisher = rospy.Publisher('/camera/image', Image, queue_size=10)
        self.bridge = CvBridge()

        # setup realsense
        self.pipeline = rs.pipeline()
        self.config = rs.config()
        self.config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)  # Color stream at 640x480 resolution
        self.config.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)  # Depth stream at 640x480 resolution
        self.pipeline.start(self.config)
        self.align_to = rs.stream.color
        self.align = rs.align(self.align_to)
        self.pc = rs.pointcloud()
        self.count = 1

        # Initialize Mediapipe Hands module
        self.mp_hands = mp.solutions.hands
        self.hands = self.mp_hands.Hands(max_num_hands=1, min_detection_confidence=0.5, min_tracking_confidence=0.5)
        self.mp_drawing = mp.solutions.drawing_utils
        self.hand_ok = None
        self.matrices = []

        # 圖像存儲路徑（可自定義）
        self.image_paths = ['/home/ctlee/catkin_ws/src/realsense_camera/src/cat1.jpg',
        '/home/ctlee/catkin_ws/src/realsense_camera/src/cat2.jpeg', '/home/ctlee/catkin_ws/src/realsense_camera/src/cat3.jpg']
        
    def camera_action_callback(self, req):
        rospy.loginfo(f"Received human detection request with process type: {req.img_process_type_realsense}")
        
        if req.img_process_type_realsense == 'human_detect':
               human_dist = self.hand_pose_detection()
               self.count+=1
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
        
    def hand_pose_detection(self):
        while True:
            # Wait for a frame
            frames = self.pipeline.wait_for_frames()
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
        color_image = cv2.flip(color_image, 1)
        rgb_image = cv2.cvtColor(color_image, cv2.COLOR_BGR2RGB)
        results = self.hands.process(rgb_image)
        hand_arr = []
        if results.multi_hand_landmarks:
            for hand_landmarks in results.multi_hand_landmarks:
                # Draw the hand landmarks
                self.mp_drawing.draw_landmarks(color_image, hand_landmarks, self.mp_hands.HAND_CONNECTIONS)
                for landmark in hand_landmarks.landmark:
                    hand_pts = [round(landmark.x, 2), round(landmark.y, 2), round(landmark.z, 2)]
                    hand_arr.append(hand_pts)
            hand_arr = np.array(hand_arr)

            self.matrices.append(hand_arr)
            stacked_matrices = np.stack(self.matrices)
            average_matrix = np.mean(stacked_matrices, axis=0)

            print(average_matrix)
            print("===========================")
        #cv2.imwrite("Hand Pose"+str(self.count)+".png", color_image)

        dist = 5

        return dist

    def safty_detection(self):
        return 0
		

if __name__ == '__main__':
    try:
        # 初始化RealsenseCameraNode並開始服務
        RealsenseCameraNode()
        rospy.spin()  # 保持服務運行，直到節點被中止
    except rospy.ROSInterruptException:
        pass

