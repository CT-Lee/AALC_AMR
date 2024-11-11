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

class realsense_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.img_process_type_realsense = null;
    }
    else {
      if (initObj.hasOwnProperty('img_process_type_realsense')) {
        this.img_process_type_realsense = initObj.img_process_type_realsense
      }
      else {
        this.img_process_type_realsense = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type realsense_srvRequest
    // Serialize message field [img_process_type_realsense]
    bufferOffset = _serializer.string(obj.img_process_type_realsense, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type realsense_srvRequest
    let len;
    let data = new realsense_srvRequest(null);
    // Deserialize message field [img_process_type_realsense]
    data.img_process_type_realsense = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.img_process_type_realsense);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'delta_amr_service/realsense_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '31c47c279a8611e4d671042d57d82526';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Delta_AMR_Service.srv
    # Request
    
    string img_process_type_realsense 
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new realsense_srvRequest(null);
    if (msg.img_process_type_realsense !== undefined) {
      resolved.img_process_type_realsense = msg.img_process_type_realsense;
    }
    else {
      resolved.img_process_type_realsense = ''
    }

    return resolved;
    }
};

class realsense_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.human_dist = null;
      this.camera_status_realsense = null;
    }
    else {
      if (initObj.hasOwnProperty('human_dist')) {
        this.human_dist = initObj.human_dist
      }
      else {
        this.human_dist = 0.0;
      }
      if (initObj.hasOwnProperty('camera_status_realsense')) {
        this.camera_status_realsense = initObj.camera_status_realsense
      }
      else {
        this.camera_status_realsense = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type realsense_srvResponse
    // Serialize message field [human_dist]
    bufferOffset = _serializer.float32(obj.human_dist, buffer, bufferOffset);
    // Serialize message field [camera_status_realsense]
    bufferOffset = _serializer.int32(obj.camera_status_realsense, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type realsense_srvResponse
    let len;
    let data = new realsense_srvResponse(null);
    // Deserialize message field [human_dist]
    data.human_dist = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [camera_status_realsense]
    data.camera_status_realsense = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'delta_amr_service/realsense_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '75fa5ea499c8db0d1f748d91dcfa33bd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Response
    
    float32 human_dist
    
    int32 camera_status_realsense
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new realsense_srvResponse(null);
    if (msg.human_dist !== undefined) {
      resolved.human_dist = msg.human_dist;
    }
    else {
      resolved.human_dist = 0.0
    }

    if (msg.camera_status_realsense !== undefined) {
      resolved.camera_status_realsense = msg.camera_status_realsense;
    }
    else {
      resolved.camera_status_realsense = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: realsense_srvRequest,
  Response: realsense_srvResponse,
  md5sum() { return '6c4e0ab4251a9095d0cdc3a5578f78f5'; },
  datatype() { return 'delta_amr_service/realsense_srv'; }
};
