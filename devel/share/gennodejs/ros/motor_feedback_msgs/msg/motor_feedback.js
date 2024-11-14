// Auto-generated. Do not edit!

// (in-package motor_feedback_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class motor_feedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.positionL = null;
      this.positionR = null;
      this.AvelocityL = null;
      this.AvelocityR = null;
      this.DvelocityL = null;
      this.DvelocityR = null;
      this.AvelocityL_lpf = null;
      this.AvelocityL_M = null;
      this.AvelocityR_lpf = null;
      this.AvelocityR_M = null;
      this.vx = null;
      this.vy = null;
      this.vth = null;
      this.delta_x = null;
      this.delta_y = null;
      this.delta_th = null;
      this.x = null;
      this.y = null;
      this.th = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('positionL')) {
        this.positionL = initObj.positionL
      }
      else {
        this.positionL = 0;
      }
      if (initObj.hasOwnProperty('positionR')) {
        this.positionR = initObj.positionR
      }
      else {
        this.positionR = 0;
      }
      if (initObj.hasOwnProperty('AvelocityL')) {
        this.AvelocityL = initObj.AvelocityL
      }
      else {
        this.AvelocityL = 0;
      }
      if (initObj.hasOwnProperty('AvelocityR')) {
        this.AvelocityR = initObj.AvelocityR
      }
      else {
        this.AvelocityR = 0;
      }
      if (initObj.hasOwnProperty('DvelocityL')) {
        this.DvelocityL = initObj.DvelocityL
      }
      else {
        this.DvelocityL = 0;
      }
      if (initObj.hasOwnProperty('DvelocityR')) {
        this.DvelocityR = initObj.DvelocityR
      }
      else {
        this.DvelocityR = 0;
      }
      if (initObj.hasOwnProperty('AvelocityL_lpf')) {
        this.AvelocityL_lpf = initObj.AvelocityL_lpf
      }
      else {
        this.AvelocityL_lpf = 0.0;
      }
      if (initObj.hasOwnProperty('AvelocityL_M')) {
        this.AvelocityL_M = initObj.AvelocityL_M
      }
      else {
        this.AvelocityL_M = 0.0;
      }
      if (initObj.hasOwnProperty('AvelocityR_lpf')) {
        this.AvelocityR_lpf = initObj.AvelocityR_lpf
      }
      else {
        this.AvelocityR_lpf = 0.0;
      }
      if (initObj.hasOwnProperty('AvelocityR_M')) {
        this.AvelocityR_M = initObj.AvelocityR_M
      }
      else {
        this.AvelocityR_M = 0.0;
      }
      if (initObj.hasOwnProperty('vx')) {
        this.vx = initObj.vx
      }
      else {
        this.vx = 0.0;
      }
      if (initObj.hasOwnProperty('vy')) {
        this.vy = initObj.vy
      }
      else {
        this.vy = 0.0;
      }
      if (initObj.hasOwnProperty('vth')) {
        this.vth = initObj.vth
      }
      else {
        this.vth = 0.0;
      }
      if (initObj.hasOwnProperty('delta_x')) {
        this.delta_x = initObj.delta_x
      }
      else {
        this.delta_x = 0.0;
      }
      if (initObj.hasOwnProperty('delta_y')) {
        this.delta_y = initObj.delta_y
      }
      else {
        this.delta_y = 0.0;
      }
      if (initObj.hasOwnProperty('delta_th')) {
        this.delta_th = initObj.delta_th
      }
      else {
        this.delta_th = 0.0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('th')) {
        this.th = initObj.th
      }
      else {
        this.th = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type motor_feedback
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [positionL]
    bufferOffset = _serializer.int32(obj.positionL, buffer, bufferOffset);
    // Serialize message field [positionR]
    bufferOffset = _serializer.int32(obj.positionR, buffer, bufferOffset);
    // Serialize message field [AvelocityL]
    bufferOffset = _serializer.int32(obj.AvelocityL, buffer, bufferOffset);
    // Serialize message field [AvelocityR]
    bufferOffset = _serializer.int32(obj.AvelocityR, buffer, bufferOffset);
    // Serialize message field [DvelocityL]
    bufferOffset = _serializer.int32(obj.DvelocityL, buffer, bufferOffset);
    // Serialize message field [DvelocityR]
    bufferOffset = _serializer.int32(obj.DvelocityR, buffer, bufferOffset);
    // Serialize message field [AvelocityL_lpf]
    bufferOffset = _serializer.float64(obj.AvelocityL_lpf, buffer, bufferOffset);
    // Serialize message field [AvelocityL_M]
    bufferOffset = _serializer.float64(obj.AvelocityL_M, buffer, bufferOffset);
    // Serialize message field [AvelocityR_lpf]
    bufferOffset = _serializer.float64(obj.AvelocityR_lpf, buffer, bufferOffset);
    // Serialize message field [AvelocityR_M]
    bufferOffset = _serializer.float64(obj.AvelocityR_M, buffer, bufferOffset);
    // Serialize message field [vx]
    bufferOffset = _serializer.float64(obj.vx, buffer, bufferOffset);
    // Serialize message field [vy]
    bufferOffset = _serializer.float64(obj.vy, buffer, bufferOffset);
    // Serialize message field [vth]
    bufferOffset = _serializer.float64(obj.vth, buffer, bufferOffset);
    // Serialize message field [delta_x]
    bufferOffset = _serializer.float64(obj.delta_x, buffer, bufferOffset);
    // Serialize message field [delta_y]
    bufferOffset = _serializer.float64(obj.delta_y, buffer, bufferOffset);
    // Serialize message field [delta_th]
    bufferOffset = _serializer.float64(obj.delta_th, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [th]
    bufferOffset = _serializer.float64(obj.th, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type motor_feedback
    let len;
    let data = new motor_feedback(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [positionL]
    data.positionL = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [positionR]
    data.positionR = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [AvelocityL]
    data.AvelocityL = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [AvelocityR]
    data.AvelocityR = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [DvelocityL]
    data.DvelocityL = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [DvelocityR]
    data.DvelocityR = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [AvelocityL_lpf]
    data.AvelocityL_lpf = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AvelocityL_M]
    data.AvelocityL_M = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AvelocityR_lpf]
    data.AvelocityR_lpf = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [AvelocityR_M]
    data.AvelocityR_M = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vx]
    data.vx = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vy]
    data.vy = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vth]
    data.vth = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delta_x]
    data.delta_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delta_y]
    data.delta_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delta_th]
    data.delta_th = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [th]
    data.th = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 128;
  }

  static datatype() {
    // Returns string type for a message object
    return 'motor_feedback_msgs/motor_feedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '539722cb0cad3c3a79793c39ccbe611c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    int32 positionL
    int32 positionR
    int32 AvelocityL
    int32 AvelocityR
    int32 DvelocityL
    int32 DvelocityR
    float64 AvelocityL_lpf
    float64 AvelocityL_M
    float64 AvelocityR_lpf
    float64 AvelocityR_M
    float64 vx
    float64 vy
    float64 vth
    float64 delta_x
    float64 delta_y
    float64 delta_th
    float64 x
    float64 y
    float64 th
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new motor_feedback(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.positionL !== undefined) {
      resolved.positionL = msg.positionL;
    }
    else {
      resolved.positionL = 0
    }

    if (msg.positionR !== undefined) {
      resolved.positionR = msg.positionR;
    }
    else {
      resolved.positionR = 0
    }

    if (msg.AvelocityL !== undefined) {
      resolved.AvelocityL = msg.AvelocityL;
    }
    else {
      resolved.AvelocityL = 0
    }

    if (msg.AvelocityR !== undefined) {
      resolved.AvelocityR = msg.AvelocityR;
    }
    else {
      resolved.AvelocityR = 0
    }

    if (msg.DvelocityL !== undefined) {
      resolved.DvelocityL = msg.DvelocityL;
    }
    else {
      resolved.DvelocityL = 0
    }

    if (msg.DvelocityR !== undefined) {
      resolved.DvelocityR = msg.DvelocityR;
    }
    else {
      resolved.DvelocityR = 0
    }

    if (msg.AvelocityL_lpf !== undefined) {
      resolved.AvelocityL_lpf = msg.AvelocityL_lpf;
    }
    else {
      resolved.AvelocityL_lpf = 0.0
    }

    if (msg.AvelocityL_M !== undefined) {
      resolved.AvelocityL_M = msg.AvelocityL_M;
    }
    else {
      resolved.AvelocityL_M = 0.0
    }

    if (msg.AvelocityR_lpf !== undefined) {
      resolved.AvelocityR_lpf = msg.AvelocityR_lpf;
    }
    else {
      resolved.AvelocityR_lpf = 0.0
    }

    if (msg.AvelocityR_M !== undefined) {
      resolved.AvelocityR_M = msg.AvelocityR_M;
    }
    else {
      resolved.AvelocityR_M = 0.0
    }

    if (msg.vx !== undefined) {
      resolved.vx = msg.vx;
    }
    else {
      resolved.vx = 0.0
    }

    if (msg.vy !== undefined) {
      resolved.vy = msg.vy;
    }
    else {
      resolved.vy = 0.0
    }

    if (msg.vth !== undefined) {
      resolved.vth = msg.vth;
    }
    else {
      resolved.vth = 0.0
    }

    if (msg.delta_x !== undefined) {
      resolved.delta_x = msg.delta_x;
    }
    else {
      resolved.delta_x = 0.0
    }

    if (msg.delta_y !== undefined) {
      resolved.delta_y = msg.delta_y;
    }
    else {
      resolved.delta_y = 0.0
    }

    if (msg.delta_th !== undefined) {
      resolved.delta_th = msg.delta_th;
    }
    else {
      resolved.delta_th = 0.0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.th !== undefined) {
      resolved.th = msg.th;
    }
    else {
      resolved.th = 0.0
    }

    return resolved;
    }
};

module.exports = motor_feedback;
