/** ******************************************************
	* @file		pub_cmdvel2odom_dummy.cpp
	* @author	Tsai,Li-chun
	******************************************************
**/


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <random>
#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Twist.h>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
/* User Includes End */

/* namespace ------------------------------------------------*/
/* namespace Begin */
/* namespace End */


/* Define ---------------------------------------------------*/
/* Define Begin */
/* Define End */


/* Typedef --------------------------------------------------*/
/* Typedef Begin */
/* Typedef End */


/* Class --------------------------------------------------*/
/* Class Begin */
/* Class End */


/* Variables ------------------------------------------------*/
/* Variables Begin */

double random_number;
std::random_device rd;
std::mt19937 gen(rd());
std::uniform_real_distribution<> dis(-0.002, 0.002);
ros::Publisher pub_odometry;
ros::Subscriber sub_cmd_vel;
nav_msgs::Odometry odom_msg;

/* Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */

void Sub_TOPIC_cmd_vel_callback(const geometry_msgs::Twist& vel);
void time_interrupter_callback(const ros::TimerEvent& time);

/* Function End */



/* ---------------------------------------------------------*/
/* ⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩ Program ⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩ ---------------------------*/
/* ---------------------------------------------------------*/
/* Program Begin */

/** * @brief  Program entry point.
	* @param argc(int) Number of input parameters
 	* @param argv(int) input parameters
 	* @return (int) Program Error.
**	**/
int main(int argc, char **argv)
{
	ros::init(argc, argv, "pub_cmdvel2odom_dummy");
	ros::NodeHandle nh;
	pub_odometry = nh.advertise<nav_msgs::Odometry>("odom", 100);
	sub_cmd_vel = nh.subscribe("cmd_vel", 100, Sub_TOPIC_cmd_vel_callback);
	ros::Timer time_interrupter = nh.createTimer(ros::Duration(0.03), time_interrupter_callback);

	ros::spin();
}

/** * @brief subscriber callback function
	* @param delta_amr_message::cas2ndagv_input_pin_msg cas2ndagv_input_pin_msg structure
 	* @return none
**/
void Sub_TOPIC_cmd_vel_callback(const geometry_msgs::Twist& vel)
{
	odom_msg.twist.twist.linear.x = vel.linear.x;
}

/** * @brief timer interrupt callback function
	* @param ros::TimerEvent TimerEvent structure
 	* @return none
**/
void time_interrupter_callback(const ros::TimerEvent& time)
{
	random_number = dis(gen);
	odom_msg.twist.twist.linear.x += random_number;
	// ROS_INFO("%lf", odom_msg.twist.twist.linear.x);
	odom_msg.header.stamp = ros::Time::now();
	pub_odometry.publish(odom_msg);
}

/* Program End */
/* ---------------------------------------------------------*/
/* ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ Program ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ ---------------------------*/
/* ---------------------------------------------------------*/


/* ***** END OF pub_cmdvel2odom_dummy.cpp ***** */