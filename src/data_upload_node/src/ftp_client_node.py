#!/usr/bin/env python3

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from ftplib import FTP
import os
from pathlib import Path
from delta_amr_service.srv import upload_srv, upload_srvResponse
import time
from ftplib import FTP, error_perm

class ImageUploader:
    def __init__(self):
        # Initialize the CvBridge for converting ROS images
        self.bridge = CvBridge()

        # FTP server information
        self.ftp_host = "192.168.1.66"  # Replace with your FTP server address
        self.ftp_port = 2121
        self.ftp_user = "user"    # FTP username
        self.ftp_pass = "password"  # FTP password
        global ftp
        self.absolute_path = os.path.dirname(__file__)
        self.relative_path = "realsense_imgs"
        self.ftp_dir = os.path.join(self.absolute_path[:-4], self.relative_path)  # Remote directory for image upload

        # Connect to the FTP server
        try:
            ftp = FTP()
            ftp.connect(self.ftp_host, self.ftp_port)
            ftp.login(self.ftp_user, self.ftp_pass)
            rospy.loginfo(f"Connected to FTP server at {self.ftp_host}:{self.ftp_port}")
            rospy.loginfo(f"Current FTP directory: {ftp.pwd()}")
        except Exception as e:
            rospy.logerr(f"Failed to connect to FTP server: {e}")
            raise

        # Subscribe to the image topic
        self.service = rospy.Service('upload_srv', upload_srv, self.upload_srv_callback)

    def upload_srv_callback(self, req):
        rospy.loginfo(f"State machine triggered: {req.upload_cmd}")

        # Upload the image to the FTP server
        self.upload_image()
        return upload_srvResponse(upload_status="done")

    def upload_image(self):
        start_time = time.time()
        for filename in os.listdir(self.ftp_dir):
            file_path = os.path.join(self.ftp_dir, filename)
            remote_filename = filename
            if os.path.isfile(file_path):
                try:
                    # Open the PNG file in binary mode for reading
                    with open(file_path, 'rb') as f:
                        # Use the STOR command to upload the file
                        ftp.storbinary(f"STOR {remote_filename}", f)
                    rospy.loginfo(f"Successfully uploaded {filename} to {remote_filename}")
                    os.remove(file_path)
                except error_perm as perm_err:
                    rospy.logerr(f"Permission error during upload: {perm_err}")
                except Exception as e:
                    rospy.logerr(f"Error uploading file: {e}")
        end_time = time.time()
        e_time = end_time - start_time
        rospy.loginfo(f"Send all PNGs with FTP needs: {e_time:.2f} seconds")

if __name__ == '__main__':
    # Initialize the ROS node
    rospy.init_node('image_uploader_node', anonymous=True)

    # Create the ImageUploader instance
    uploader = ImageUploader()

    # Keep the node running
    rospy.spin()
