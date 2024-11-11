#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2

# 全局的bridge对象
bridge = CvBridge()

# 全局列表用于存储接收到的图像
image_list = []

def image_callback(msg):
    global image_list

    # 将ROS的Image消息转换为OpenCV格式
    try:
        image = bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        rospy.loginfo("Image received and added to list.")
        
        # 将图像添加到列表中
        image_list.append(image)
        
        # 如果列表中已有3张图像
        if len(image_list) == 3:
            rospy.loginfo("3 images collected, ready to display.")
            
            # 依次显示图像
            for idx, img in enumerate(image_list):
                cv2.imshow(f"Image {idx + 1}", img)
                
                # 等待按任意键切换到下一张
                cv2.waitKey(0)
                
                # 关闭当前窗口
                cv2.destroyWindow(f"Image {idx + 1}")
            
            # 清空列表以便接收下一组图像
            image_list.clear()
            rospy.loginfo("Image list cleared, waiting for the next set of images.")

    except Exception as e:
        rospy.logerr(f"Failed to convert or display image: {e}")

def image_subscriber():
    # 初始化ROS节点
    rospy.init_node('upload_node', anonymous=True)
    
    # 订阅图像topic
    rospy.Subscriber('/camera/image', Image, image_callback)
    
    # 保持节点运行
    rospy.spin()
    
    # 退出时关闭所有OpenCV窗口
    cv2.destroyAllWindows()

if __name__ == '__main__':
    try:
        image_subscriber()
    except rospy.ROSInterruptException:
        pass

