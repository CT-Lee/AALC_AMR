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

class delta_amr_serviceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.img_process_type_realsense = null;
      this.img_process_type_mechmind = null;
      this.robot_mov_type = null;
      this.robot_mov_point = null;
      this.robot_mov_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('img_process_type_realsense')) {
        this.img_process_type_realsense = initObj.img_process_type_realsense
      }
      else {
        this.img_process_type_realsense = '';
      }
      if (initObj.hasOwnProperty('img_process_type_mechmind')) {
        this.img_process_type_mechmind = initObj.img_process_type_mechmind
      }
      else {
        this.img_process_type_mechmind = '';
      }
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
        this.robot_mov_speed = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type delta_amr_serviceRequest
    // Serialize message field [img_process_type_realsense]
    bufferOffset = _serializer.string(obj.img_process_type_realsense, buffer, bufferOffset);
    // Serialize message field [img_process_type_mechmind]
    bufferOffset = _serializer.string(obj.img_process_type_mechmind, buffer, bufferOffset);
    // Serialize message field [robot_mov_type]
    bufferOffset = _serializer.string(obj.robot_mov_type, buffer, bufferOffset);
    // Serialize message field [robot_mov_point]
    bufferOffset = _serializer.string(obj.robot_mov_point, buffer, bufferOffset);
    // Serialize message field [robot_mov_speed]
    bufferOffset = _serializer.int32(obj.robot_mov_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type delta_amr_serviceRequest
    let len;
    let data = new delta_amr_serviceRequest(null);
    // Deserialize message field [img_process_type_realsense]
    data.img_process_type_realsense = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [img_process_type_mechmind]
    data.img_process_type_mechmind = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot_mov_type]
    data.robot_mov_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot_mov_point]
    data.robot_mov_point = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot_mov_speed]
    data.robot_mov_speed = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.img_process_type_realsense);
    length += _getByteLength(object.img_process_type_mechmind);
    length += _getByteLength(object.robot_mov_type);
    length += _getByteLength(object.robot_mov_point);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'delta_amr_service/delta_amr_serviceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4e8d5e0a421c9f98f64d5abd9fa2e5da';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Delta_AMR_Service.srv
    # Request
    
    string img_process_type_realsense 
    string img_process_type_mechmind 
    
    string robot_mov_type 
    string robot_mov_point
    int32 robot_mov_speed
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new delta_amr_serviceRequest(null);
    if (msg.img_process_type_realsense !== undefined) {
      resolved.img_process_type_realsense = msg.img_process_type_realsense;
    }
    else {
      resolved.img_process_type_realsense = ''
    }

    if (msg.img_process_type_mechmind !== undefined) {
      resolved.img_process_type_mechmind = msg.img_process_type_mechmind;
    }
    else {
      resolved.img_process_type_mechmind = ''
    }

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
      resolved.robot_mov_speed = 0
    }

    return resolved;
    }
};

class delta_amr_serviceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.human_dist = null;
      this.robot_running_status = null;
    }
    else {
      if (initObj.hasOwnProperty('human_dist')) {
        this.human_dist = initObj.human_dist
      }
      else {
        this.human_dist = 0;
      }
      if (initObj.hasOwnProperty('robot_running_status')) {
        this.robot_running_status = initObj.robot_running_status
      }
      else {
        this.robot_running_status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type delta_amr_serviceResponse
    // Serialize message field [human_dist]
    bufferOffset = _serializer.int32(obj.human_dist, buffer, bufferOffset);
    // Serialize message field [robot_running_status]
    bufferOffset = _serializer.int32(obj.robot_running_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type delta_amr_serviceResponse
    let len;
    let data = new delta_amr_serviceResponse(null);
    // Deserialize message field [human_dist]
    data.human_dist = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [robot_running_status]
    data.robot_running_status = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'delta_amr_service/delta_amr_serviceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '851a5260ab80914e72bdc2c4ecfd5cca';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Response
    
    int32 human_dist
    
    int32 robot_running_status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new delta_amr_serviceResponse(null);
    if (msg.human_dist !== undefined) {
      resolved.human_dist = msg.human_dist;
    }
    else {
      resolved.human_dist = 0
    }

    if (msg.robot_running_status !== undefined) {
      resolved.robot_running_status = msg.robot_running_status;
    }
    else {
      resolved.robot_running_status = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: delta_amr_serviceRequest,
  Response: delta_amr_serviceResponse,
  md5sum() { return '5f036b9efe5e6058b93abe4b32fb58c0'; },
  datatype() { return 'delta_amr_service/delta_amr_service'; }
};
