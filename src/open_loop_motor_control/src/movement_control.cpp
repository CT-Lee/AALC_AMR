/** ******************************************************
	* @file		movement_control.cpp
	* @author	Tsai,Li-chun
	******************************************************
**/


/* System Includes ------------------------------------------*/
/* System Includes Begin */
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "movement_control.hpp"
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
/* Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */



/* ---------------------------------------------------------*/
/* ⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩ Program ⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩ ---------------------------*/
/* ---------------------------------------------------------*/
/* Program Begin */

/** * @brief movement_control object constructor
	* @param None
 	* @return none
**/
movement_control::movement_control():
	wait_running_cycle(false),
	nh(),
	loop_rate(1)
{
	/* initialization pub_cmd_vel */
	pub_cmd_vel = nh.advertise<geometry_msgs::Twist>(TOPIC_cmd_vel, queue_size, this);
	/* initialization sub_odometry */
	sub_odometry = nh.subscribe(TOPIC_odom, queue_size, &movement_control::Sub_TOPIC_odometry_callback, this);
	/* init timer interrupt object */
	time_interrupter = nh.createTimer(ros::Duration(running_cycle), &movement_control::time_interrupter_callback, this);

	twist_msg.linear.y = 0;
	twist_msg.linear.z = 0;
	twist_msg.angular.x = 0;
	twist_msg.angular.y = 0;
	twist_msg.angular.z = 0;
}

/** * @brief movement_control object destructor
	* @param None
 	* @return none
**/
movement_control::~movement_control()
{
}

/** * @brief walk a straight line based on input parameters
	* @param int(targetSpeed) max speeed
	* @param int(endSpeed) end speeed
	* @param int(endSpeed) walk distance
	* @param int(acc) acceleration
	* @param int(dec) deceleration
 	* @return none
**/
void movement_control::straight_profile(int64_t targetSpeed, int64_t endVx, int64_t distance, int64_t acc_dec)
{
	long decelerationRequired;
	long curVx = odom_msg.twist.twist.linear.x;
	wait_running_cycle=true;
	ROS_INFO("%ld",curVx);
	while( distance>0 )
	{
		while(wait_running_cycle){}	wait_running_cycle=true;
		decelerationRequired = ( (curVx*curVx)-(endVx*endVx) )/(2*distance);
		if( decelerationRequired >= acc_dec ) targetSpeed = endVx;
		if(curVx < targetSpeed) curVx += acc_dec;
		if(curVx > targetSpeed) curVx -= acc_dec;
		distance = distance- curVx;
		if(curVx<=0)	{distance=0;curVx=0;}
		twist_msg.linear.x = curVx;
		ROS_INFO("%ld",curVx);
		pub_cmd_vel.publish(twist_msg);
	}
	twist_msg.linear.x = endVx;
	ROS_INFO("%lf",twist_msg.linear.x);
	pub_cmd_vel.publish(twist_msg);
}

/** * @brief movement_control object odometry subscriber callback function
	* @param nav_msgs::Odometry& odometry data structure
 	* @return none
**/
void movement_control::Sub_TOPIC_odometry_callback(const nav_msgs::Odometry& odom)
{
	odom_msg = odom;
}

/** * @brief movement_control object timer interrupt callback function
	* @param ros::TimerEvent TimerEvent structure
 	* @return none
**/
void movement_control::time_interrupter_callback(const ros::TimerEvent& time)
{
	wait_running_cycle = false;

	// odom.twist.twist.linear.x = vx;
	// odom.twist.twist.linear.y = vy;
	// odom.twist.twist.angular.z = vth;
}


/* Program End */
/* ---------------------------------------------------------*/
/* ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ Program ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ ---------------------------*/
/* ---------------------------------------------------------*/


/* ***** END OF movement_control.cpp ***** */