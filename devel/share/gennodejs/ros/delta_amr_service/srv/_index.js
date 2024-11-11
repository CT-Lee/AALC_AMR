
"use strict";

let robot_control_srv = require('./robot_control_srv.js')
let mechmind_srv = require('./mechmind_srv.js')
let upload_srv = require('./upload_srv.js')
let realsense_srv = require('./realsense_srv.js')

module.exports = {
  robot_control_srv: robot_control_srv,
  mechmind_srv: mechmind_srv,
  upload_srv: upload_srv,
  realsense_srv: realsense_srv,
};
