/** ******************************************************
	* @file		ser_call_straight_profile_dummy.cpp
	* @author	Tsai,Li-chun
	******************************************************
**/


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <ros/ros.h>
#include <delta_amr_service/amr_movement_control.h>
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

/** * @brief  Program entry point.
	* @param argc(int) Number of input parameters
 	* @param argv(int) input parameters
 	* @return (int) Program Error.
**	**/
int main(int argc, char **argv)
{
	ros::init(argc, argv, "ser_call_straight_profile_dummy");
	if (argc != 5)
	{
		ROS_INFO("input parameters required by [%s] must include targetSpeed, endVx, distance, acc_dec", SERVICE_amr_movement_control_straight);
		return 1;
	}
	ros::NodeHandle nh;
	ros::ServiceClient client = nh.serviceClient<delta_amr_service::amr_movement_control>(SERVICE_amr_movement_control_straight);
	delta_amr_service::amr_movement_control ser_mc;
	ser_mc.request.targetSpeed = atol(argv[1]);
	ser_mc.request.endVx = atol(argv[2]);
	ser_mc.request.distance = atol(argv[3]);
	ser_mc.request.acc_dec = atol(argv[4]);
	// ROS_INFO("%5ld, %5ld, %5ld, %5ld", ser_mc.request.targetSpeed, ser_mc.request.endVx, ser_mc.request.distance, ser_mc.request.acc_dec);
	if (client.call(ser_mc))
	{
		ROS_INFO("[%s] complate!",SERVICE_amr_movement_control_straight);
	}
	else
	{
		ROS_ERROR("Failed to call service [%s]",SERVICE_amr_movement_control_straight);
		return 1;
	}


	return 0;
}

/* Program End */
/* ---------------------------------------------------------*/
/* ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ Program ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ ---------------------------*/
/* ---------------------------------------------------------*/


/* ***** END OF ser_call_straight_profile_dummy.cpp ***** */