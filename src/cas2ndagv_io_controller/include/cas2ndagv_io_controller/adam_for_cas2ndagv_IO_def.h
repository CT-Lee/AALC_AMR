/** ******************************************************
	* @file		adam_for_cas2ndagv_IO_def.hpp
	* @author	Tsai,Li-chun
	******************************************************
**	**/

/* Define to prevent recursive inclusi ----------------------*/
#ifndef __adam_for_cas2ndagv_IO_def_H__
#define __adam_for_cas2ndagv_IO_def_H__


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <stdint.h>
#include <string>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
/* User Includes End */


/* Define ---------------------------------------------------*/
/* Define Begin */
/* Define End */


/* Extern Class -------------------------------------------*/
/* Extern Class Begin */

/* define LiDAR current OSSD running status */
struct CAS2ndAGV_IO_status_lidarOSSD
{
	const std::string normal = "normal";
	const std::string slow_stop = "slow_stop";
	const std::string emergency_stop = "emergency_stop";
};
/* define current LiDAR map in use */
struct CAS2ndAGV_IO_status_lidarMAP
{
	const std::string normal_walking = "normal_walking";
	const std::string workstation1 = "workstation1";
};
/* define emergency stop button status */
struct CAS2ndAGV_IO_status_EMS
{
	const std::string normal = "normal";
	const std::string emergency_stop = "emergency_stop";
	const std::string bypass = "bypass";
};
/* define emergency stop button status */
struct CAS2ndAGV_IO_status_carlights
{
	const std::string standby = "standby";			/*  */
	const std::string straight = "straight";		/* all g */
	const std::string reverse = "reverse";			/* flash g */
	const std::string left = "left";				/* left g */
	const std::string right = "right";				/* right g */
	const std::string charging = "charging";		/*  */
	const std::string workstation = "workstation";	/*  */
	const std::string handshake = "handshake";		/* flash y */
	const std::string error = "error";				/* all r */
};
/* define cas2ndagv top state */
struct CAS2ndAGV_IO_status_struct
{
	const CAS2ndAGV_IO_status_lidarOSSD lidarOSSD;
	const CAS2ndAGV_IO_status_lidarMAP lidarMAP;
	const CAS2ndAGV_IO_status_EMS EMS;
	const CAS2ndAGV_IO_status_carlights light;
};

/* Extern Class End */


/* Extern Typedef -------------------------------------------*/
/* Extern Typedef Begin */
/* Extern Typedef End */

/* Extern Variables -----------------------------------------*/
/* Extern Variables Begin */
/* Extern Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */


#endif /*__adam_for_cas2ndagv_IO_def_H__ */

/* ***** END OF adam_for_cas2ndagv_IO_def.HPP ***** */