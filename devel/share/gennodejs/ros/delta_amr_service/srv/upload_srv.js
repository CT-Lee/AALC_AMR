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

class upload_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.upload_cmd = null;
    }
    else {
      if (initObj.hasOwnProperty('upload_cmd')) {
        this.upload_cmd = initObj.upload_cmd
      }
      else {
        this.upload_cmd = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type upload_srvRequest
    // Serialize message field [upload_cmd]
    bufferOffset = _serializer.string(obj.upload_cmd, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type upload_srvRequest
    let len;
    let data = new upload_srvRequest(null);
    // Deserialize message field [upload_cmd]
    data.upload_cmd = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.upload_cmd);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'delta_amr_service/upload_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7c1c533946e4ad554fe5ef8f8b3a59d6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Delta_AMR_Service.srv
    # Request
    
    string upload_cmd
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new upload_srvRequest(null);
    if (msg.upload_cmd !== undefined) {
      resolved.upload_cmd = msg.upload_cmd;
    }
    else {
      resolved.upload_cmd = ''
    }

    return resolved;
    }
};

class upload_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.upload_status = null;
    }
    else {
      if (initObj.hasOwnProperty('upload_status')) {
        this.upload_status = initObj.upload_status
      }
      else {
        this.upload_status = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type upload_srvResponse
    // Serialize message field [upload_status]
    bufferOffset = _serializer.string(obj.upload_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type upload_srvResponse
    let len;
    let data = new upload_srvResponse(null);
    // Deserialize message field [upload_status]
    data.upload_status = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.upload_status);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'delta_amr_service/upload_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a6b8f654fd88edaa3e1f877ad079871a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Response
    
    string upload_status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new upload_srvResponse(null);
    if (msg.upload_status !== undefined) {
      resolved.upload_status = msg.upload_status;
    }
    else {
      resolved.upload_status = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: upload_srvRequest,
  Response: upload_srvResponse,
  md5sum() { return '9509961624cae8e89290906327b798e8'; },
  datatype() { return 'delta_amr_service/upload_srv'; }
};
