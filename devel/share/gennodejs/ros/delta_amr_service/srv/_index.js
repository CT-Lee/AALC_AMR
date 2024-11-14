
"use strict";

let realsense_srv = require('./realsense_srv.js')
let amr_srv = require('./amr_srv.js')
let mechmind_srv = require('./mechmind_srv.js')
let robot_control_srv = require('./robot_control_srv.js')
let upload_srv = require('./upload_srv.js')

module.exports = {
  realsense_srv: realsense_srv,
  amr_srv: amr_srv,
  mechmind_srv: mechmind_srv,
  robot_control_srv: robot_control_srv,
  upload_srv: upload_srv,
};
