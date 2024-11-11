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

class mechmind_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.img_process_type_mechmind = null;
    }
    else {
      if (initObj.hasOwnProperty('img_process_type_mechmind')) {
        this.img_process_type_mechmind = initObj.img_process_type_mechmind
      }
      else {
        this.img_process_type_mechmind = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mechmind_srvRequest
    // Serialize message field [img_process_type_mechmind]
    bufferOffset = _serializer.string(obj.img_process_type_mechmind, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mechmind_srvRequest
    let len;
    let data = new mechmind_srvRequest(null);
    // Deserialize message field [img_process_type_mechmind]
    data.img_process_type_mechmind = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.img_process_type_mechmind);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'delta_amr_service/mechmind_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '023ff47aa255851e90471aa3da084720';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Delta_AMR_Service.srv
    # Request
    
    string img_process_type_mechmind 
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mechmind_srvRequest(null);
    if (msg.img_process_type_mechmind !== undefined) {
      resolved.img_process_type_mechmind = msg.img_process_type_mechmind;
    }
    else {
      resolved.img_process_type_mechmind = ''
    }

    return resolved;
    }
};

class mechmind_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.camera_status = null;
    }
    else {
      if (initObj.hasOwnProperty('camera_status')) {
        this.camera_status = initObj.camera_status
      }
      else {
        this.camera_status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mechmind_srvResponse
    // Serialize message field [camera_status]
    bufferOffset = _serializer.int32(obj.camera_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mechmind_srvResponse
    let len;
    let data = new mechmind_srvResponse(null);
    // Deserialize message field [camera_status]
    data.camera_status = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'delta_amr_service/mechmind_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5d93bc37b6aad1095038c91fe2329616';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Response
    
    int32 camera_status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mechmind_srvResponse(null);
    if (msg.camera_status !== undefined) {
      resolved.camera_status = msg.camera_status;
    }
    else {
      resolved.camera_status = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: mechmind_srvRequest,
  Response: mechmind_srvResponse,
  md5sum() { return '7e7b687eeeaf11191ef09103f57fbbe7'; },
  datatype() { return 'delta_amr_service/mechmind_srv'; }
};
