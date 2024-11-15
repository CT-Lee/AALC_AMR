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
enum class CAS2ndAGV_IO_status_lidarOSSD: uint16_t
{
	normal = 0,
	slow_stop = 1,
	emergency_stop = 2
};
/* define current LiDAR map in use */
enum class CAS2ndAGV_IO_status_lidarMAP: uint16_t
{
	normal_walking = 0,
	workstation1 = 1
};
/* define emergency stop button status */
enum class CAS2ndAGV_IO_status_EMS: uint16_t
{
	normal = 0,
	emergency_stop = 1,
	bypass = 2
};
/* define emergency stop button status */
enum class CAS2ndAGV_IO_status_carlights: uint16_t
{
	straight = 0,
	reverse = 1,
	left = 2,
	right = 3,
	workstation = 4,
	error = 5,
};

/* Extern Class End */


/* Extern Typedef -------------------------------------------*/
/* Extern Typedef Begin */

/*  */
struct CAS2ndAGV_IO_status_struct
{
	CAS2ndAGV_IO_status_lidarOSSD lidarOSSD;
	CAS2ndAGV_IO_status_lidarMAP lidarMAP;
	CAS2ndAGV_IO_status_EMS EMS;
	CAS2ndAGV_IO_status_carlights light;
};

/* Extern Typedef End */

/* Extern Variables -----------------------------------------*/
/* Extern Variables Begin */
/* Extern Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */


#endif /*__adam_for_cas2ndagv_IO_def_H__ */

/* ***** END OF adam_for_cas2ndagv_IO_def.HPP ***** */