#!/usr/bin/env python3

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import ftplib
import tempfile
import os
from pathlib import Path
from delta_amr_service.srv import upload_srv, upload_srvResponse

class ImageUploader:
    def __init__(self):
        # Initialize the CvBridge for converting ROS images
        self.bridge = CvBridge()

        # container which saves images for each iteration
        self.img_storage = []

        # FTP server information
        self.ftp_host = "192.168.1.254"  # Replace with your FTP server address
        self.ftp_port = 21
        self.ftp_user = "user"    # FTP username
        self.ftp_pass = "password"  # FTP password
        self.absolute_path = os.path.dirname(__file__)
        self.relative_path = "realsense_imgs"
        self.ftp_dir = os.path.join(self.absolute_path[:-4], self.relative_path)# Remote directory for image upload
        
        # Connect to the FTP server
        self.ftp = ftplib.FTP()
        self.ftp.connect(self.ftp_host,self.ftp_port)
        self.ftp.login(self.ftp_user, self.ftp_pass)

        # Subscribe to the image topic
        self.image_sub = rospy.Subscriber('realsense_rgb_img', Image, self.image_callback)
        self.service = rospy.Service('upload_srv', upload_srv, self.upload_srv_callback)

    def upload_srv_callback(self, req):
        rospy.loginfo(f"State machine triggered: {req.upload_cmd}")
        for cv_image in self.img_storage:
            _, img_path = tempfile.mkstemp(suffix='.png', dir = self.ftp_dir)  # Create a temporary file to save the image
            cv2.imwrite(img_path, cv_image)
            rospy.loginfo(f"Image saved to temporary file: {img_path}")
            # Upload the image to the FTP server
            self.upload_image(img_path)
            # Clean up by removing the temporary file after upload
            #os.remove(img_path)
        self.img_storage = []
        return upload_srvResponse(upload_status = "done")

    def image_callback(self, msg):
        try:
            print('get_rgb_img')
            # Convert the ROS image message to an OpenCV image
            cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
            self.img_storage.append(cv_image)
        except Exception as e:
            rospy.logerr(f"Error processing image: {str(e)}")

    def upload_image(self, img_path):
        try:
            # Open the image file in binary mode
            with open(img_path, 'rb') as f:
                filename = os.path.basename(img_path)
                remote_file_path = os.path.join(self.ftp_dir, filename)
                print(remote_file_path)
                # Upload the image to the FTP server using STOR command
                self.ftp.storbinary(f"STOR {remote_file_path}", f)
                rospy.loginfo(f"Image uploaded to {remote_file_path} on the FTP server")

        except Exception as e:
            rospy.logerr(f"Error uploading image to FTP: {str(e)}")

if __name__ == '__main__':
    # Initialize the ROS node
    rospy.init_node('image_uploader_node', anonymous=True)

    # Create the ImageUploader instance
    uploader = ImageUploader()

    # Keep the node running
    rospy.spin()

