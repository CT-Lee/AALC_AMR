// Auto-generated. Do not edit!

// (in-package delta_amr_service.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class robot_control_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robot_mov_type = null;
      this.robot_mov_point = null;
      this.robot_mov_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('robot_mov_type')) {
        this.robot_mov_type = initObj.robot_mov_type
      }
      else {
        this.robot_mov_type = '';
      }
      if (initObj.hasOwnProperty('robot_mov_point')) {
        this.robot_mov_point = initObj.robot_mov_point
      }
      else {
        this.robot_mov_point = '';
      }
      if (initObj.hasOwnProperty('robot_mov_speed')) {
        this.robot_mov_speed = initObj.robot_mov_speed
      }
      else {
        this.robot_mov_speed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_control_srvRequest
    // Serialize message field [robot_mov_type]
    bufferOffset = _serializer.string(obj.robot_mov_type, buffer, bufferOffset);
    // Serialize message field [robot_mov_point]
    bufferOffset = _serializer.string(obj.robot_mov_point, buffer, bufferOffset);
    // Serialize message field [robot_mov_speed]
    bufferOffset = _serializer.float32(obj.robot_mov_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_control_srvRequest
    let len;
    let data = new robot_control_srvRequest(null);
    // Deserialize message field [robot_mov_type]
    data.robot_mov_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot_mov_point]
    data.robot_mov_point = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot_mov_speed]
    data.robot_mov_speed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.robot_mov_type);
    length += _getByteLength(object.robot_mov_point);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'delta_amr_service/robot_control_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a122c484e7bbcdd0759055620a95c6f0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Delta_AMR_Service.srv
    # Request
    
    string robot_mov_type 
    string robot_mov_point
    float32 robot_mov_speed
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_control_srvRequest(null);
    if (msg.robot_mov_type !== undefined) {
      resolved.robot_mov_type = msg.robot_mov_type;
    }
    else {
      resolved.robot_mov_type = ''
    }

    if (msg.robot_mov_point !== undefined) {
      resolved.robot_mov_point = msg.robot_mov_point;
    }
    else {
      resolved.robot_mov_point = ''
    }

    if (msg.robot_mov_speed !== undefined) {
      resolved.robot_mov_speed = msg.robot_mov_speed;
    }
    else {
      resolved.robot_mov_speed = 0.0
    }

    return resolved;
    }
};

class robot_control_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robot_running_status = null;
    }
    else {
      if (initObj.hasOwnProperty('robot_running_status')) {
        this.robot_running_status = initObj.robot_running_status
      }
      else {
        this.robot_running_status = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_control_srvResponse
    // Serialize message field [robot_running_status]
    bufferOffset = _serializer.string(obj.robot_running_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_control_srvResponse
    let len;
    let data = new robot_control_srvResponse(null);
    // Deserialize message field [robot_running_status]
    data.robot_running_status = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.robot_running_status);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'delta_amr_service/robot_control_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ade36ca20dba09160c3384a70217e7ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Response
    
    string robot_running_status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_control_srvResponse(null);
    if (msg.robot_running_status !== undefined) {
      resolved.robot_running_status = msg.robot_running_status;
    }
    else {
      resolved.robot_running_status = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: robot_control_srvRequest,
  Response: robot_control_srvResponse,
  md5sum() { return '0dd95aee29323b73c925a0c69e911119'; },
  datatype() { return 'delta_amr_service/robot_control_srv'; }
};
