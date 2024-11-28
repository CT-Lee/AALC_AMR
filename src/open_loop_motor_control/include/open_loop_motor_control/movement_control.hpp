/** ******************************************************
	* @file		movement_control.hpp
	* @author	Tsai,Li-chun
	******************************************************
**/

/* Define to prevent recursive inclusi ----------------------*/
#ifndef __movement_control_HPP__
#define __movement_control_HPP__


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Twist.h>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
/* User Includes End */


/* Define ---------------------------------------------------*/
/* Define Begin */

#define TOPIC_cmd_vel "cmd_vel"
#define TOPIC_odom "odom"
#define queue_size 100
#define running_cycle 0.1

/* Define End */


/* Extern Typedef -------------------------------------------*/
/* Extern Typedef Begin */
/* Extern Typedef End */


/* Extern Class -------------------------------------------*/
/* Extern Class Begin */

/* define cas 2nd agv io-status transform object */
class movement_control
{
/* private member */
private:
	/* wait for running_cycle to finish flag */
	bool wait_running_cycle;
	/* define return code */
	int rc;
	/* create ros node handle */
	ros::NodeHandle nh;
	/* create ros loop rate */
	ros::Rate loop_rate;
	/* create cmd_vel publisher object */
	ros::Publisher pub_cmd_vel;
	/* create odometry subscriber object */
	ros::Subscriber sub_odometry;
	/* create ros timer interrupt object */
	ros::Timer time_interrupter;

	/* create Odometry data structure */
	nav_msgs::Odometry odom_msg;
	/* create cmd_vel(twist) data structure */
	geometry_msgs::Twist twist_msg;

/* public member */
public:
	movement_control();	/* constructor */
	~movement_control();	/* destructor */

	void straight_profile(int64_t targetSpeed, int64_t endSpeed, int64_t distance, int64_t acc_dec);

	void Sub_TOPIC_odometry_callback(const nav_msgs::Odometry& odom);
	void time_interrupter_callback(const ros::TimerEvent& time);
};

/* Extern Class End */


/* Extern Variables -----------------------------------------*/
/* Extern Variables Begin */
/* Extern Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */


#endif /*__movement_control_HPP__ */

/* ***** END OF movement_control.HPP ***** */