/** ******************************************************
	* @file		cas2ndagv_io_ctl.hpp
	* @author	Tsai,Li-chun
	******************************************************
**/

/* Define to prevent recursive inclusi ----------------------*/
#ifndef __cas2ndagv_io_ctl_HPP__
#define __cas2ndagv_io_ctl_HPP__


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <ros/ros.h>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "ADAM_HandShake.hpp"
/* User Includes End */


/* Define ---------------------------------------------------*/
/* Define Begin */
/* Define End */


/* Extern Typedef -------------------------------------------*/
/* Extern Typedef Begin */
/* Extern Typedef End */


/* Extern Class -------------------------------------------*/
/* Extern Class Begin */

/* define cas 2nd agv io control object */
class cas2ndagv_io_ctl
{
/* private member */
private:
	/* define return code */
	int rc;
	/* create ADAM control object */
	ADAM_HandShake ADAM_HS;
	/* create ros node handle */
	ros::NodeHandle nh;
	

/* public member */
public:
	cas2ndagv_io_ctl();		/* constructor */
	~cas2ndagv_io_ctl();	/* destructor */

};

/* Extern Class End */


/* Extern Variables -----------------------------------------*/
/* Extern Variables Begin */
/* Extern Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */


#endif /*__cas2ndagv_io_ctl_HPP__ */

/* ***** END OF cas2ndagv_io_ctl.HPP ***** */