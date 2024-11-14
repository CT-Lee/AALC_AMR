#!/usr/bin/env python3
import rospy
from delta_amr_service.srv import realsense_srv, realsense_srvResponse
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image
import os
import numpy as np
import pyrealsense2 as rs
from threading import Thread

class RealsenseCameraNode:
    def __init__(self):
        rospy.init_node('realsense_camera_node', anonymous=True)
        
        # Service for human detection
        self.service = rospy.Service('realsense_srv', realsense_srv, self.human_detect_callback)
        
        rospy.loginfo("Realsense Camera Node initialized.")
        
        # Publishers and cv bridge
        self.image_publisher = rospy.Publisher('/camera/image', Image, queue_size=10)
        self.bridge = CvBridge()
        
        # Image paths (customize as needed)
        self.image_paths = ['/home/ctlee/catkin_ws/src/realsense_camera/src/cat1.jpg',
                            '/home/ctlee/catkin_ws/src/realsense_camera/src/cat2.jpeg', 
                            '/home/ctlee/catkin_ws/src/realsense_camera/src/cat3.jpg']
        
        # RealSense pipeline setup
        self.pipeline = rs.pipeline()
        self.cfg = rs.config()
        self.cfg.enable_stream(rs.stream.depth, 1280, 720, rs.format.z16, 30)
        self.cfg.enable_stream(rs.stream.color, 1280, 720, rs.format.bgr8, 30)
        self.alignedFs = rs.align(rs.stream.color)
        self.pipeline.start(self.cfg)

        # Start continuous capture in a separate thread
        self.color_image = None
        self.capture_thread = Thread(target=self.take_image)
        self.capture_thread.start()
    
    def take_image(self):
        try:
            while not rospy.is_shutdown():
                frames = self.pipeline.wait_for_frames()
                aligned_frames = self.alignedFs.process(frames)
                color_frame = aligned_frames.get_color_frame()
                
                if color_frame:
                    # Update with the latest color image
                    self.color_image = np.asanyarray(color_frame.get_data())
                    
                    # Display the color image in a real-time window
                    cv2.imshow("RealSense Capture", self.color_image)
                    
                    # Refresh the window; press 'q' to close display if needed
                    if cv2.waitKey(1) & 0xFF == ord('q'):
                        break
                
                rospy.Rate(25).sleep()  # Control the capture rate
        finally:
            self.pipeline.stop()
            cv2.destroyAllWindows()  # Close display window when pipeline stops
        
    def human_detect_callback(self, req):
        rospy.loginfo(f"Received request with process type: {req.img_process_type_realsense}")
        
        # Handle human detection request
        if req.img_process_type_realsense == 'human_detect':
            rospy.sleep(1)  # Simulate processing time
            # yolo(self.color_image)
            human_dist = 3.5  # Example distance value
            rospy.loginfo(f"Human detected at distance: {human_dist} meters.")
            return realsense_srvResponse(camera_status_realsense=0, human_dist=human_dist)
        
        # Handle take picture request
        elif req.img_process_type_realsense == 'take_pic':
#            if self.color_image is not None:
                # Publish the most recent color image
#                color_msg = self.bridge.cv2_to_imgmsg(self.color_image, 'bgr8')
#                self.image_publisher.publish(color_msg)
#                rospy.loginfo(f"Published current frame for {image_path}")
#                rospy.sleep(0.1)  # Delay for sending next image
            return realsense_srvResponse(camera_status_realsense=0, human_dist=0.0)

        # Handle unknown request types
        else:
            rospy.logwarn("Unknown process type requested.")
            return realsense_srvResponse(camera_status_realsense=-1, human_dist=0.0)

if __name__ == '__main__':
    try:
        # Initialize node and service
        node = RealsenseCameraNode()
        rospy.spin()  # Keep the node running
    except rospy.ROSInterruptException:
        pass

