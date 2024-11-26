/** ******************************************************
	* @file		pub_io2status_dummy.cpp
	* @author	Tsai,Li-chun
	******************************************************
**/


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <ros/ros.h>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "adam_for_cas2ndagv_IO_def.h"
#include "delta_amr_message/cas2ndagv_io2state_in.h"
#include "delta_amr_message/cas2ndagv_io2state_out.h"
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
int count = 0;
ros::Publisher pub_io2status_out;
ros::Subscriber sub_io2status_in;
delta_amr_message::cas2ndagv_io2state_in cas2ndagv_io2status_in_msg;
delta_amr_message::cas2ndagv_io2state_out cas2ndagv_io2status_out_msg;
const CAS2ndAGV_IO_status_struct CAS2ndAGV_IO_status;

/* Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */

void Sub_TOPIC_cas2ndagv_io2state_in_callback(const delta_amr_message::cas2ndagv_io2state_in& io2s_in);
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
	ros::init(argc, argv, "pub_io2status_dummy");
	ros::NodeHandle nh;
	ros::Timer time_interrupter = nh.createTimer(ros::Duration(10), time_interrupter_callback);
	pub_io2status_out = nh.advertise<delta_amr_message::cas2ndagv_io2state_out>("TOPIC_cas2ndagv_io2state_out", 100);
	sub_io2status_in = nh.subscribe("TOPIC_cas2ndagv_io2state_in", 100, Sub_TOPIC_cas2ndagv_io2state_in_callback);

	ros::spin();
}

/** * @brief subscriber callback function
	* @param delta_amr_message::cas2ndagv_input_pin_msg cas2ndagv_input_pin_msg structure
 	* @return none
**/
void Sub_TOPIC_cas2ndagv_io2state_in_callback(const delta_amr_message::cas2ndagv_io2state_in& io2s_in)
{
	cas2ndagv_io2status_in_msg.EMS = io2s_in.EMS;
	cas2ndagv_io2status_in_msg.lidarOSSD = io2s_in.lidarOSSD;
}

/** * @brief timer interrupt callback function
	* @param ros::TimerEvent TimerEvent structure
 	* @return none
**/
void time_interrupter_callback(const ros::TimerEvent& time)
{
	if( count==1 )
	{
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.standby;
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
	}
	else if( count==2 )
	{
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.standby;
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.workstation1;
	}
	else if( count==3 )
	{
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.straight;
	}
	else if( count==4 )
	{
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.reverse;
	}
	else if( count==5 )
	{
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.left;
	}
	else if( count==6 )
	{
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.right;
	}
	else if( count==7 )
	{
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.charging;
	}
	else if( count==8 )
	{
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.workstation;
	}
	else if( count==9 )
	{
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.handshake;
	}
	else if( count==10 )
	{
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.error;
		count = 0;
	}
	pub_io2status_out.publish(cas2ndagv_io2status_out_msg);
	count++;
}

/* Program End */
/* ---------------------------------------------------------*/
/* ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ Program ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ ---------------------------*/
/* ---------------------------------------------------------*/


/* ***** END OF pub_io2status_dummy.cpp ***** */