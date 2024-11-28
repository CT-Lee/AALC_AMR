/** ******************************************************
	* @file		Oriental_BLVD_KRD.cpp
	* @author	Tsai,Li-chun
	******************************************************
**	**/


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <unistd.h>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "Oriental_BLVD_KRD.hpp"
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

/** * @brief Constructor - modbusRTU mode setup
 	* @param device(char*) Modbus Device File path
 	* @param BR(int) Baud Rate
 	* @param parity(int) even/odd parity, default 'N'
 	* @param data_bit(int) DataBit Length, default 8(bit)
 	* @param stop_bit(int) StopBit Length, default 1(bit)
 	* @param slave(int) Modbus Device ID, default 1
 	* @return None
**	**/
BLVD_KRD_Control::BLVD_KRD_Control(const char* device,int slave,
									 int BR, char parity,
									 int data_bit, int stop_bit )
{
	throw_msg = "[BLVD_KRD_Control]";
	/* 初始化modbus通訊設定 */
	mb = modbus_new_rtu(device,BR,parity,data_bit,stop_bit);
	/* 初始化是否成功判斷 */
	if( mb == NULL )
	{	
#ifdef raw_message
		/* 若初始化失敗,打印訊息,退出程序 */
		std::cout << TC_ERROR << modbus_strerror(errno) << TC_RESET << std::endl;
#endif
		// exit(BLVD_KRD_structure_ERROR);
		throw_msg += " create modbus_t structure fail";
		throw std::runtime_error(throw_msg.c_str());
	}
	else
	{	
#ifdef raw_message
		/* 若初始化成功,打印訊息 */
		std::cout << "Initialize BLVD-KRD modbus_t Structure Success!" << std::endl;
#endif
	}	

	/* 設定欲通訊的modbus-slaveID */
	rc = modbus_set_slave(mb,slave);
	if( rc != 0 )
	{	
#ifdef raw_message
		/* 若設定失敗,打印訊息,退出建構函數 */
		ROS_INFO("BLVD-KRD modbus set slave Failure!");
		// printf("BLVD-KRD modbus set slave Failure!\n");
#endif
		// exit(BLVD_KRD_set_slave_ERROR);
		throw_msg += " set modbus slave fail";
		throw std::runtime_error(throw_msg.c_str());
	}
#ifdef raw_message
	else	/* 若slaveID設定成功,打印訊息 */
		std::cout << "set modbus slave [" << slave << "] Success!" << std::endl;
#endif


	/* 建立連結 */
	rc = modbus_connect(mb);
	if( rc != 0 )
	{	
#ifdef raw_message
        /* 若設定失敗,打印訊息,退出建構函數 */
		std::cout << TC_ERROR << "BLVD-KRD modbus connect Failure!" << std::endl;
		std::cout << "    ==> " << modbus_strerror(errno) << TC_RESET << std::endl;
#endif
		// exit(BLVD_KRD_connect_ERROR);
		throw_msg += " connect modbus fail";
		throw std::runtime_error(throw_msg.c_str());
	}
#ifdef raw_message
	else	/* 若連結成功,打印訊息 */
		std::cout << "[Create Oriental_BLVD_KRD] connect modbus slave [" << slave << "] Success!" << std::endl;
#endif

}

/** * @brief Destructor
 	* @param None
 	* @return None
**	**/
BLVD_KRD_Control::~BLVD_KRD_Control()
{
	/* 關閉連結 */
	modbus_close(mb);
	/* 釋放modbus通訊結構體的位址 */
	modbus_free(mb);
#ifdef raw_message
	/* 打印關閉訊息 */
	std::cout << "BLVD-KRD modbus connect close!" << std::endl;
	// printf("BLVD-KRD modbus connect close\n");
#endif
}

/** * @brief motor initialize
	* @param None
 	* @return (int)
**	**/
int BLVD_KRD_Control::motorInit(uint32_t OpType, uint32_t Acc, uint32_t Dec, int32_t Trigger)
{
	if( writeSetupType(OpType)<=0 )
		return BLVD_KRD_SetupOType_ERROR;
	if( writeAcceleration(Acc)<=0 )
		return BLVD_KRD_SetupAcc_ERROR;
	if( writeDecelerate(Dec)<=0 )
		return BLVD_KRD_SetupDec_ERROR;
	if( writeTorque(1000)<=0 )
		return BLVD_KRD_SetupTorque_ERROR;
	if( writeTrigger(Trigger)<=0 )
		return BLVD_KRD_SetupTrigger_ERROR;

	if( motorSON()<=0 )
		return BLVD_KRD_ServoON_ERROR;

	sleep(5);

	if( BLVD_KRD_DriverOutputStatus_check()<=0 )
		return BLVD_KRD_Output_ERROR;
	
	return 0;
}

/** * @brief check driver output status
	* @param None
 	* @return (bool)
**	**/
bool BLVD_KRD_Control::BLVD_KRD_DriverOutputStatus_check(void)
{
	bool success[2] = {false,false};
	int32_t flag_rdy,flag_err;
	readDriverOutputStatus();
	// printf("motorStatus : %016x %016x\n",motorStatus[0],motorStatus[1]);
	flag_err = (int32_t)DriverOutputCommand_Table::DriverOutputCommand_ALM;
	flag_err |= (int32_t)DriverOutputCommand_Table::DriverOutputCommand_STOP;
	flag_rdy = (int32_t)DriverOutputCommand_Table::DriverOutputCommand_RDY_DD;
	flag_rdy |= (int32_t)DriverOutputCommand_Table::DriverOutputCommand_SON;
	if( (motorStatus[0]&flag_err) == 0 )
		if( (motorStatus[0]&flag_rdy) == flag_rdy )
		{
			// printf("success[0] = true\n");
			success[0] = true;
		}
	if( (motorStatus[1]&flag_err) == 0 )
		if( (motorStatus[1]&flag_rdy) == flag_rdy )
		{
			// printf("success[1] = true\n");
			success[1] = true;
		}
	// printf("%d %d\n",success[0], success[1]);
	return (success[0]&success[1]);
}

/** * @brief Motor Stop
	* @param None
 	* @return (int)
**	**/
int BLVD_KRD_Control::motorStop(void)
{
	DriverInputCommand_Table DIC_T = DriverInputCommand_Table::DriverInputCommand_STOP;
	rc = writeDriverInputCommand((uint32_t)DIC_T);
	return rc;
}

/** * @brief Put the motor into an excitation state
	* @param None
 	* @return (int)
**	**/
int BLVD_KRD_Control::motorSON(void)
{
	DriverInputCommand_Table DIC_T = DriverInputCommand_Table::DriverInputCommand_SON;
	rc = writeDriverInputCommand((uint32_t)DIC_T);
	return rc;
}

/** * @brief Put the motor into an non-excitation state
	* @param None
 	* @return (int)
**	**/
int BLVD_KRD_Control::motorSOFF(void)
{
	DriverInputCommand_Table DIC_T = DriverInputCommand_Table::DriverInputCommand_AllOff;
	rc = writeDriverInputCommand((uint32_t)DIC_T);
	return rc;
}

/** * @brief motor forward test
	* @param v(int32_t) motor forward velocity
 	* @return (int)
**	**/
int BLVD_KRD_Control::motorForward(int32_t v)
{
	rc = writeVelocity(v,v);
	return rc;
}

/** * @brief motor reverse test
	* @param v(int32_t) motor reverse velocity
 	* @return (int)
**	**/
int BLVD_KRD_Control::motorReverse(int32_t v)
{
	rc = writeVelocity(-v,-v);
	return rc;
}

/** * @brief motor L-turn test
	* @param w(int32_t) motor L-turn velocity
 	* @return (int)
**	**/
int BLVD_KRD_Control::motorLturn(int32_t w)
{
return 0;
}

/** * @brief motor R-turn test
	* @param w(int32_t) motor R-turn velocity
 	* @return (int)
**	**/
int BLVD_KRD_Control::motorRturn(int32_t w)
{
return 0;
}


#if 1 /* read simple parameter */
/** * @brief 讀取速度設定值
	* @param speed(int32_t*) Demand speed
 	* @return (int)
**	**/
int BLVD_KRD_Control::readDemandVelocity(int32_t *speed)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_r_DemandVelocity;
	rc = readRegisters(RAT,6,uint16Buffer);
	// motor L
	speed[1] = 0;
	speed[1] = (speed[1]|uint16Buffer[0])<<16;
	speed[1] |= uint16Buffer[1];
	// motor R
	speed[0] = 0;
	speed[0] = (speed[0]|uint16Buffer[3])<<16;
	speed[0] |= uint16Buffer[4];
	return rc;
}

/** * @brief 讀取實際速度
	* @param speed(int32_t*) feedback speed
 	* @return (int)
**	**/
int BLVD_KRD_Control::readActualVelocity(int32_t *speed)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_r_ActualVelocity;
	rc = readRegisters(RAT,6,uint16Buffer);
	// printf("%05d\n",(int)RAT);
	// motor L
	speed[1] = 0;
	speed[1] = (speed[1]|uint16Buffer[0])<<16;
	speed[1] |= uint16Buffer[1];
	// motor R
	speed[0] = 0;
	speed[0] = (speed[0]|uint16Buffer[3])<<16;
	speed[0] |= uint16Buffer[4];
	// printf("%08x(%05d) , %08x(%05d)\n",speed[0],speed[0],speed[1],speed[1]);
	return rc;
}

/** * @brief 讀取目前運轉位置(累計)
	* @param position(int32_t*) Actual position
 	* @return (int)
**	**/
int BLVD_KRD_Control::readActualPosition(int32_t *position)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_r_ActualPosition;
	rc = readRegisters(RAT,6,uint16Buffer);
	// motor L
	position[1] = 0;
	position[1] = (position[1]|uint16Buffer[0])<<16;
	position[1] |= uint16Buffer[1];
	// motor R
	position[0] = 0;
	position[0] = (position[0]|uint16Buffer[3])<<16;
	position[0] |= uint16Buffer[4];
	return rc;
}

/** * @brief 讀取馬達轉矩負載率
	* @param torque(int32_t*) Load Torque
 	* @return (int)
**	**/
int BLVD_KRD_Control::readLoadTorque(int32_t *torque)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_r_PresentTorque;
	rc = readRegisters(RAT,6,uint16Buffer);
	// motor L
	torque[1] = 0;
	torque[1] = (torque[1]|uint16Buffer[0])<<16;
	torque[1] |= uint16Buffer[1];
	// motor R
	torque[0] = 0;
	torque[0] = (torque[0]|uint16Buffer[3])<<16;
	torque[0] |= uint16Buffer[4];
	return rc;
}

/** * @brief 讀取Driver溫度
	* @param temperature(int32_t*) Driver temperature
 	* @return (int)
**	**/
int BLVD_KRD_Control::readDriverTemperature(int32_t *temperature)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_r_DriverTemperature;
	rc = readRegisters(RAT,6,uint16Buffer);
	// motor L
	temperature[1] = 0;
	temperature[1] = (temperature[1]|uint16Buffer[0])<<16;
	temperature[1] |= uint16Buffer[1];
	// motor R
	temperature[0] = 0;
	temperature[0] = (temperature[0]|uint16Buffer[3])<<16;
	temperature[0] |= uint16Buffer[4];
	return rc;
}

/** * @brief 讀取Motor溫度
	* @param temperature(int32_t*) Motor temperature
 	* @return (int)
**	**/
int BLVD_KRD_Control::readMotorTemperature(int32_t *temperature)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_r_MotorTemperature;
	rc = readRegisters(RAT,6,uint16Buffer);
	// motor L
	temperature[1] = 0;
	temperature[1] = (temperature[1]|uint16Buffer[0])<<16;
	temperature[1] |= uint16Buffer[1];
	// motor R
	temperature[0] = 0;
	temperature[0] = (temperature[0]|uint16Buffer[3])<<16;
	temperature[0] |= uint16Buffer[4];
	return rc;
}

/** * @brief 讀取Driver耗能
	* @param consumption(int32_t*) Power Consumption
 	* @return (int)
**	**/
int BLVD_KRD_Control::readPowerConsumption(int32_t *consumption)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_r_PowerConsumption;
	rc = readRegisters(RAT,6,uint16Buffer);
	// motor L
	consumption[1] = 0;
	consumption[1] = (consumption[1]|uint16Buffer[0])<<16;
	consumption[1] |= uint16Buffer[1];
	// motor R
	consumption[0] = 0;
	consumption[0] = (consumption[0]|uint16Buffer[3])<<16;
	consumption[0] |= uint16Buffer[4];
	return rc;
}

/** * @brief 讀取Driver輸出狀態
	* @param status(int32_t*) Driver Output Status
 	* @return (int)
**	**/
int BLVD_KRD_Control::readDriverOutputStatus(void)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_r_DriverOutputStatus;
	rc = readRegisters(RAT,6,uint16Buffer);
	// motor R
	motorStatus[1] = 0;
	motorStatus[1] = (motorStatus[1]|uint16Buffer[0])<<16;
	motorStatus[1] |= uint16Buffer[1];
	// motor L
	motorStatus[0] = 0;
	motorStatus[0] = (motorStatus[0]|uint16Buffer[3])<<16;
	motorStatus[0] |= uint16Buffer[4];
	// printf("motorStatus : %016x %016x\n",motorStatus[1],motorStatus[0]);
	return rc;
}
#endif /* read simple parameter */

#if 1 /* write(set) simple parameter */
/** * @brief 寫入工作模式
	* @param mode(int32_t) operation type
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeSetupType(int32_t mode)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_w_SetupType;
	int32_to_2uint16(mode,uint16Buffer);
	int32_to_2uint16(mode,(uint16Buffer+2));
	// printf("%05x %05x\n",uint16Buffer[0],uint16Buffer[1]);
	// printf("%05x %05x\n",uint16Buffer[2],uint16Buffer[3]);
	rc = writeRegisters(RAT,4,uint16Buffer);
	return rc;
}

/** * @brief 寫入速度設定值
	* @param Lvelocity(int32_t) Set the operating Lmotor velocity
	* @param Rvelocity(int32_t) Set the operating Rmotor velocity
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeVelocity(int32_t Lvelocity,int32_t Rvelocity)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_w_Velocity;
	int32_to_2uint16(Rvelocity,uint16Buffer);
	int32_to_2uint16(Lvelocity,(uint16Buffer+2));
	// printf("%0d , %0d\n",Lvelocity ,Rvelocity);
	rc = writeRegisters(RAT,4,uint16Buffer);
	return rc;
}

/** * @brief 寫入加速度設定值
	* @param acc(int32_t) Set the operating acceleration
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeAcceleration(int32_t acc)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_w_Acc;
	int32_to_2uint16(acc,uint16Buffer);
	int32_to_2uint16(acc,(uint16Buffer+2));
	// printf("%05x %05x\n",uint16Buffer[0],uint16Buffer[1]);
	// printf("%05x %05x\n",uint16Buffer[2],uint16Buffer[3]);
	rc = writeRegisters(RAT,4,uint16Buffer);
	return rc;
}

/** * @brief 寫入減速度設定值
	* @param dec(int32_t) Set the operating decelerate
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeDecelerate(int32_t dec)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_w_Dec;
	int32_to_2uint16(dec,uint16Buffer);
	int32_to_2uint16(dec,(uint16Buffer+2));
	// printf("%05x %05x\n",uint16Buffer[0],uint16Buffer[1]);
	// printf("%05x %05x\n",uint16Buffer[2],uint16Buffer[3]);
	rc = writeRegisters(RAT,4,uint16Buffer);
	return rc;
}

/** * @brief 寫入力矩
	* @param torque(int32_t) Set the operating torque
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeTorque(int32_t torque)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_w_Torque;
	int32_to_2uint16(torque,uint16Buffer);
	int32_to_2uint16(torque,(uint16Buffer+2));
	rc = writeRegisters(RAT,4,uint16Buffer);
	return rc;
}

/** * @brief 寫入觸發方式
	* @param trigger(int32_t) Set the operating trigger
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeTrigger(int32_t trigger)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_w_Trigger;
	int32_to_2uint16(trigger,uint16Buffer);
	int32_to_2uint16(trigger,(uint16Buffer+2));
	rc = writeRegisters(RAT,4,uint16Buffer);
	return rc;
}

/** * @brief 寫入Driver輸入狀態
	* @param status(int32_t) Set the operating status
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeDriverInputCommand(int32_t status)
{
	BLVD_KRD_RegAdr_Table RAT=BLVD_KRD_RegAdr_Table::ADRS_w_DriverInputCommand;
	int32_to_2uint16(status,uint16Buffer);
	int32_to_2uint16(status,(uint16Buffer+2));
	rc = writeRegisters(RAT,4,uint16Buffer);
	return rc;
}

/** * @brief diagnose the communication between a master and a slave.
	* @param None
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeDiagnosis(void)
{
return 0;
}
#endif /* write(set) simple parameter END */

#if 1 /* Alarm relevant */
/** * @brief Read Present Alarm.
	* @param alarm(int32_t*)
 	* @return int
**	**/
int BLVD_KRD_Control::readAlarm(int32_t *alarm)
{
return 0;
}

/** * @brief Read Communication Error.
	* @param err(int32_t*)
 	* @return int
**	**/
int BLVD_KRD_Control::readCommunicationError(int32_t *err)
{
return 0;
}

/** * @brief RESET Alarm.
	* @param None
 	* @return none
**	**/
int BLVD_KRD_Control::ResetAlarm(void)
{
return 0;
}

/** * @brief AlarmCode to StringMessage.
	* @param alarm(uint8_t) AlarmCode
 	* @return (uint8_t)
**	**/
std::string BLVD_KRD_Control::getStrOfAlarm(uint8_t alarm)
{
  switch ((AlarmCode)alarm)
  {
    case AlarmCode::CommunicationSwitchSettingError:
      return "Communication switch setting error";
    case AlarmCode::EEPROMError:
      return "EEPROM error";
    case AlarmCode::ExternalStop:
      return "External stop";
    case AlarmCode::InitialSensorError:
      return "Internal sensor error";
    case AlarmCode::MainCicruitOutputError:
      return "Main circuit output error";
    case AlarmCode::MainCicruitOverheat:
      return "Main circuit overheat";
    case AlarmCode::NetworkBusError:
      return "Network bus error";
    case AlarmCode::NetworkConverterError:
      return "NetworkConvertError";
    case AlarmCode::None:
      return "None";
    case AlarmCode::Overcurrent:
      return "Overcurrent";
    case AlarmCode::Overload:
      return "Overload";
    case AlarmCode::Overspeed:
      return "Overspeed";
    case AlarmCode::Overvoltage:
      return "Overvoltage";
    case AlarmCode::PreventionOfOperationAtPowerOn:
      return "Prevention of operation at power on";
    case AlarmCode::RS485CommunicationError:
      return "RS485 communicaton error";
    case AlarmCode::RS485CommunicationTimeout:
      return "RS485 communication timeout";
    case AlarmCode::SensorError:
      return "Sensor error";
    case AlarmCode::Undervoltage:
      return "Undervoltage";
  }
  return "";
}
#endif /* Alarm relevant END */

#if 1 /* Read data relevant */
/** * @brief Read Int32t data(single register data)
	* @param Adr(uint16_t) Register start Address
	* @param v(int32_t*) Response Data Address
 	* @return (int)
**	**/
int BLVD_KRD_Control::readInt32t(uint16_t Adr, int32_t *v)
{
return 0;
}

/** * @brief Read data for multiple successive registers
	* @param Adr(uint16_t) Register start Address
	* @param L(uint16_t) Number of registers
	* @param Data(int32_t*) Value read from register address
 	* @return (int)
**	**/
int BLVD_KRD_Control::readRegisters(BLVD_KRD_RegAdr_Table Adr, uint8_t L, uint16_t *Data)
{
	rc = modbus_read_registers(mb, (int)Adr, L, uint16Buffer);
	return rc;
}
#endif /* Read data relevant END */

#if 1 /* Write data relevant */
/** * @brief Write Int32t data(single register data)
	* @param Adr(uint16_t) Register start Address
	* @param Data(int32_t*) Value written to the register address
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeInt32t(uint16_t Adr, int32_t *Data)
{
return 0;
}

/** * @brief Write data to multiple successive registers
	* @param Adr(uint16_t) Register start Address
	* @param L(uint16_t) Number of registers
	* @param Data(int32_t*) Value written to the registers address
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeRegisters(BLVD_KRD_RegAdr_Table Adr, uint8_t L, uint16_t *Data)
{
	rc = modbus_write_registers(mb, (int)Adr, L, uint16Buffer);
	return rc;
}

/** * @brief Send modbus raw request
	* @param FC(uint8_t) modbus FunctionCode
	* @param L(uint16_t) Number of registers
	* @param Data(int32_t*) Value written to the registers address
 	* @return (int)
**	**/
int BLVD_KRD_Control::writeQuery(uint16_t L, uint8_t *Data)
{
	rc = modbus_send_raw_request(mb, uint8Buffer, L*sizeof(uint8_t));
	return rc;
}
#endif /* Write data relevant END */

#if 1 /* Type Cast relevant */
/** * @brief int32轉uint16[2] function
	* @param data32(int32_t) 
	* @param data16(int16_t*) 
 	* @return (uint16_t*)
**	**/
uint16_t* BLVD_KRD_Control::int32_to_2uint16(int32_t data32, uint16_t *data16)
{
	modbus_32FormatTo16Format buffer_32to16;
	buffer_32to16.d32 = data32;
	*data16 = buffer_32to16.d16[1];
	*(data16+1) = buffer_32to16.d16[0];
	return (data16+2);
}
#endif /* Type Cast relevant */

/* Program End */
/* ---------------------------------------------------------*/
/* ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ Program ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ ---------------------------*/
/* ---------------------------------------------------------*/


/* ***** END OF Oriental_BLVD_KRD.cpp ***** */
