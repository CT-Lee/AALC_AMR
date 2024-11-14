#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from ftplib import FTP
import os

# FTP server connection function
def connect_to_ftp_server(host, port, username, password):
    ftp = FTP()
    ftp.connect(host, port)
    print("here")
    ftp.login(username, password)
    rospy.loginfo(f"Connected to FTP server at {host}")
    return ftp

# Function to upload a PNG file to the FTP server
def upload_png_file(ftp):
    directory_path = "/home/cas-standIPC/ros1_ws/src/data_upload_node/pngs"
    #local_filename = "231128_2_delta_8f.pgm"
    #remote_filename = local_filename
    for filename in os.listdir(directory_path):
        file_path = os.path.join(directory_path, filename)
        remote_filename = filename
        if os.path.isfile(file_path):
            try:
                # Open the PNG file in binary mode for reading
                with open(file_path, 'rb') as f:
                    # Use the STOR command to upload the file
                    ftp.storbinary(f"STOR {remote_filename}", f)
                rospy.loginfo(f"Successfully uploaded {filename} to {remote_filename}")
            except Exception as e:
                rospy.logerr(f"Error uploading file: {e}")

# Callback function to handle FTP commands
def ftp_callback(msg):
    # The command message is expected to contain the local and remote file names
    command = msg.data
    if command == "upload":
        upload_png_file(ftp)
    else:
        rospy.logwarn(f"Unrecognized command: {command}")

# Main function for the ROS node
def ftp_client_node():
    # Initialize the ROS node
    rospy.init_node('ftp_client_node', anonymous=True)

    # FTP server information
    ftp_host = "192.168.1.254"  # Replace with your FTP server address
    ftp_port = 21
    ftp_username = "user"    # FTP username
    ftp_password = "password"  # FTP password

    # Connect to the FTP server
    global ftp
    ftp = connect_to_ftp_server(ftp_host, ftp_port, ftp_username, ftp_password)

    # Subscribe to the "ftp_upload" topic to receive upload commands
    rospy.Subscriber("ftp_upload", String, ftp_callback)

    # Keep the node running and listening for messages
    rospy.spin()

if __name__ == '__main__':
    try:
        ftp_client_node()
    except rospy.ROSInterruptException:
        rospy.logerr("FTP Client Node interrupted")
