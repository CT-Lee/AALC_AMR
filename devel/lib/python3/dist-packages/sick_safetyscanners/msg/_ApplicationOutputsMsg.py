# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from sick_safetyscanners/ApplicationOutputsMsg.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ApplicationOutputsMsg(genpy.Message):
  _md5sum = "04afaf34d19dee3d3399e6f11d12df15"
  _type = "sick_safetyscanners/ApplicationOutputsMsg"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """bool[] evaluation_path_outputs_eval_out
bool[] evaluation_path_outputs_is_safe
bool[] evaluation_path_outputs_is_valid

uint16[] monitoring_case_number_outputs 
bool[] monitoring_case_number_outputs_flags

uint8 sleep_mode_output
bool sleep_mode_output_valid

bool error_flag_contamination_warning
bool error_flag_contamination_error
bool error_flag_manipulation_error
bool error_flag_glare
bool error_flag_reference_contour_intruded
bool error_flag_critical_error
bool error_flags_are_valid


int16 linear_velocity_outputs_velocity_0
bool linear_velocity_outputs_velocity_0_valid
bool linear_velocity_outputs_velocity_0_transmitted_safely

int16 linear_velocity_outputs_velocity_1
bool linear_velocity_outputs_velocity_1_valid
bool linear_velocity_outputs_velocity_1_transmitted_safely

int16[] resulting_velocity
bool[] resulting_velocity_flags

 
"""
  __slots__ = ['evaluation_path_outputs_eval_out','evaluation_path_outputs_is_safe','evaluation_path_outputs_is_valid','monitoring_case_number_outputs','monitoring_case_number_outputs_flags','sleep_mode_output','sleep_mode_output_valid','error_flag_contamination_warning','error_flag_contamination_error','error_flag_manipulation_error','error_flag_glare','error_flag_reference_contour_intruded','error_flag_critical_error','error_flags_are_valid','linear_velocity_outputs_velocity_0','linear_velocity_outputs_velocity_0_valid','linear_velocity_outputs_velocity_0_transmitted_safely','linear_velocity_outputs_velocity_1','linear_velocity_outputs_velocity_1_valid','linear_velocity_outputs_velocity_1_transmitted_safely','resulting_velocity','resulting_velocity_flags']
  _slot_types = ['bool[]','bool[]','bool[]','uint16[]','bool[]','uint8','bool','bool','bool','bool','bool','bool','bool','bool','int16','bool','bool','int16','bool','bool','int16[]','bool[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       evaluation_path_outputs_eval_out,evaluation_path_outputs_is_safe,evaluation_path_outputs_is_valid,monitoring_case_number_outputs,monitoring_case_number_outputs_flags,sleep_mode_output,sleep_mode_output_valid,error_flag_contamination_warning,error_flag_contamination_error,error_flag_manipulation_error,error_flag_glare,error_flag_reference_contour_intruded,error_flag_critical_error,error_flags_are_valid,linear_velocity_outputs_velocity_0,linear_velocity_outputs_velocity_0_valid,linear_velocity_outputs_velocity_0_transmitted_safely,linear_velocity_outputs_velocity_1,linear_velocity_outputs_velocity_1_valid,linear_velocity_outputs_velocity_1_transmitted_safely,resulting_velocity,resulting_velocity_flags

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ApplicationOutputsMsg, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.evaluation_path_outputs_eval_out is None:
        self.evaluation_path_outputs_eval_out = []
      if self.evaluation_path_outputs_is_safe is None:
        self.evaluation_path_outputs_is_safe = []
      if self.evaluation_path_outputs_is_valid is None:
        self.evaluation_path_outputs_is_valid = []
      if self.monitoring_case_number_outputs is None:
        self.monitoring_case_number_outputs = []
      if self.monitoring_case_number_outputs_flags is None:
        self.monitoring_case_number_outputs_flags = []
      if self.sleep_mode_output is None:
        self.sleep_mode_output = 0
      if self.sleep_mode_output_valid is None:
        self.sleep_mode_output_valid = False
      if self.error_flag_contamination_warning is None:
        self.error_flag_contamination_warning = False
      if self.error_flag_contamination_error is None:
        self.error_flag_contamination_error = False
      if self.error_flag_manipulation_error is None:
        self.error_flag_manipulation_error = False
      if self.error_flag_glare is None:
        self.error_flag_glare = False
      if self.error_flag_reference_contour_intruded is None:
        self.error_flag_reference_contour_intruded = False
      if self.error_flag_critical_error is None:
        self.error_flag_critical_error = False
      if self.error_flags_are_valid is None:
        self.error_flags_are_valid = False
      if self.linear_velocity_outputs_velocity_0 is None:
        self.linear_velocity_outputs_velocity_0 = 0
      if self.linear_velocity_outputs_velocity_0_valid is None:
        self.linear_velocity_outputs_velocity_0_valid = False
      if self.linear_velocity_outputs_velocity_0_transmitted_safely is None:
        self.linear_velocity_outputs_velocity_0_transmitted_safely = False
      if self.linear_velocity_outputs_velocity_1 is None:
        self.linear_velocity_outputs_velocity_1 = 0
      if self.linear_velocity_outputs_velocity_1_valid is None:
        self.linear_velocity_outputs_velocity_1_valid = False
      if self.linear_velocity_outputs_velocity_1_transmitted_safely is None:
        self.linear_velocity_outputs_velocity_1_transmitted_safely = False
      if self.resulting_velocity is None:
        self.resulting_velocity = []
      if self.resulting_velocity_flags is None:
        self.resulting_velocity_flags = []
    else:
      self.evaluation_path_outputs_eval_out = []
      self.evaluation_path_outputs_is_safe = []
      self.evaluation_path_outputs_is_valid = []
      self.monitoring_case_number_outputs = []
      self.monitoring_case_number_outputs_flags = []
      self.sleep_mode_output = 0
      self.sleep_mode_output_valid = False
      self.error_flag_contamination_warning = False
      self.error_flag_contamination_error = False
      self.error_flag_manipulation_error = False
      self.error_flag_glare = False
      self.error_flag_reference_contour_intruded = False
      self.error_flag_critical_error = False
      self.error_flags_are_valid = False
      self.linear_velocity_outputs_velocity_0 = 0
      self.linear_velocity_outputs_velocity_0_valid = False
      self.linear_velocity_outputs_velocity_0_transmitted_safely = False
      self.linear_velocity_outputs_velocity_1 = 0
      self.linear_velocity_outputs_velocity_1_valid = False
      self.linear_velocity_outputs_velocity_1_transmitted_safely = False
      self.resulting_velocity = []
      self.resulting_velocity_flags = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.evaluation_path_outputs_eval_out)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(struct.Struct(pattern).pack(*self.evaluation_path_outputs_eval_out))
      length = len(self.evaluation_path_outputs_is_safe)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(struct.Struct(pattern).pack(*self.evaluation_path_outputs_is_safe))
      length = len(self.evaluation_path_outputs_is_valid)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(struct.Struct(pattern).pack(*self.evaluation_path_outputs_is_valid))
      length = len(self.monitoring_case_number_outputs)
      buff.write(_struct_I.pack(length))
      pattern = '<%sH'%length
      buff.write(struct.Struct(pattern).pack(*self.monitoring_case_number_outputs))
      length = len(self.monitoring_case_number_outputs_flags)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(struct.Struct(pattern).pack(*self.monitoring_case_number_outputs_flags))
      _x = self
      buff.write(_get_struct_9Bh2Bh2B().pack(_x.sleep_mode_output, _x.sleep_mode_output_valid, _x.error_flag_contamination_warning, _x.error_flag_contamination_error, _x.error_flag_manipulation_error, _x.error_flag_glare, _x.error_flag_reference_contour_intruded, _x.error_flag_critical_error, _x.error_flags_are_valid, _x.linear_velocity_outputs_velocity_0, _x.linear_velocity_outputs_velocity_0_valid, _x.linear_velocity_outputs_velocity_0_transmitted_safely, _x.linear_velocity_outputs_velocity_1, _x.linear_velocity_outputs_velocity_1_valid, _x.linear_velocity_outputs_velocity_1_transmitted_safely))
      length = len(self.resulting_velocity)
      buff.write(_struct_I.pack(length))
      pattern = '<%sh'%length
      buff.write(struct.Struct(pattern).pack(*self.resulting_velocity))
      length = len(self.resulting_velocity_flags)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(struct.Struct(pattern).pack(*self.resulting_velocity_flags))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.evaluation_path_outputs_eval_out = s.unpack(str[start:end])
      self.evaluation_path_outputs_eval_out = list(map(bool, self.evaluation_path_outputs_eval_out))
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.evaluation_path_outputs_is_safe = s.unpack(str[start:end])
      self.evaluation_path_outputs_is_safe = list(map(bool, self.evaluation_path_outputs_is_safe))
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.evaluation_path_outputs_is_valid = s.unpack(str[start:end])
      self.evaluation_path_outputs_is_valid = list(map(bool, self.evaluation_path_outputs_is_valid))
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sH'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.monitoring_case_number_outputs = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.monitoring_case_number_outputs_flags = s.unpack(str[start:end])
      self.monitoring_case_number_outputs_flags = list(map(bool, self.monitoring_case_number_outputs_flags))
      _x = self
      start = end
      end += 17
      (_x.sleep_mode_output, _x.sleep_mode_output_valid, _x.error_flag_contamination_warning, _x.error_flag_contamination_error, _x.error_flag_manipulation_error, _x.error_flag_glare, _x.error_flag_reference_contour_intruded, _x.error_flag_critical_error, _x.error_flags_are_valid, _x.linear_velocity_outputs_velocity_0, _x.linear_velocity_outputs_velocity_0_valid, _x.linear_velocity_outputs_velocity_0_transmitted_safely, _x.linear_velocity_outputs_velocity_1, _x.linear_velocity_outputs_velocity_1_valid, _x.linear_velocity_outputs_velocity_1_transmitted_safely,) = _get_struct_9Bh2Bh2B().unpack(str[start:end])
      self.sleep_mode_output_valid = bool(self.sleep_mode_output_valid)
      self.error_flag_contamination_warning = bool(self.error_flag_contamination_warning)
      self.error_flag_contamination_error = bool(self.error_flag_contamination_error)
      self.error_flag_manipulation_error = bool(self.error_flag_manipulation_error)
      self.error_flag_glare = bool(self.error_flag_glare)
      self.error_flag_reference_contour_intruded = bool(self.error_flag_reference_contour_intruded)
      self.error_flag_critical_error = bool(self.error_flag_critical_error)
      self.error_flags_are_valid = bool(self.error_flags_are_valid)
      self.linear_velocity_outputs_velocity_0_valid = bool(self.linear_velocity_outputs_velocity_0_valid)
      self.linear_velocity_outputs_velocity_0_transmitted_safely = bool(self.linear_velocity_outputs_velocity_0_transmitted_safely)
      self.linear_velocity_outputs_velocity_1_valid = bool(self.linear_velocity_outputs_velocity_1_valid)
      self.linear_velocity_outputs_velocity_1_transmitted_safely = bool(self.linear_velocity_outputs_velocity_1_transmitted_safely)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sh'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.resulting_velocity = s.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.resulting_velocity_flags = s.unpack(str[start:end])
      self.resulting_velocity_flags = list(map(bool, self.resulting_velocity_flags))
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.evaluation_path_outputs_eval_out)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(self.evaluation_path_outputs_eval_out.tostring())
      length = len(self.evaluation_path_outputs_is_safe)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(self.evaluation_path_outputs_is_safe.tostring())
      length = len(self.evaluation_path_outputs_is_valid)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(self.evaluation_path_outputs_is_valid.tostring())
      length = len(self.monitoring_case_number_outputs)
      buff.write(_struct_I.pack(length))
      pattern = '<%sH'%length
      buff.write(self.monitoring_case_number_outputs.tostring())
      length = len(self.monitoring_case_number_outputs_flags)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(self.monitoring_case_number_outputs_flags.tostring())
      _x = self
      buff.write(_get_struct_9Bh2Bh2B().pack(_x.sleep_mode_output, _x.sleep_mode_output_valid, _x.error_flag_contamination_warning, _x.error_flag_contamination_error, _x.error_flag_manipulation_error, _x.error_flag_glare, _x.error_flag_reference_contour_intruded, _x.error_flag_critical_error, _x.error_flags_are_valid, _x.linear_velocity_outputs_velocity_0, _x.linear_velocity_outputs_velocity_0_valid, _x.linear_velocity_outputs_velocity_0_transmitted_safely, _x.linear_velocity_outputs_velocity_1, _x.linear_velocity_outputs_velocity_1_valid, _x.linear_velocity_outputs_velocity_1_transmitted_safely))
      length = len(self.resulting_velocity)
      buff.write(_struct_I.pack(length))
      pattern = '<%sh'%length
      buff.write(self.resulting_velocity.tostring())
      length = len(self.resulting_velocity_flags)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(self.resulting_velocity_flags.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.evaluation_path_outputs_eval_out = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
      self.evaluation_path_outputs_eval_out = list(map(bool, self.evaluation_path_outputs_eval_out))
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.evaluation_path_outputs_is_safe = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
      self.evaluation_path_outputs_is_safe = list(map(bool, self.evaluation_path_outputs_is_safe))
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.evaluation_path_outputs_is_valid = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
      self.evaluation_path_outputs_is_valid = list(map(bool, self.evaluation_path_outputs_is_valid))
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sH'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.monitoring_case_number_outputs = numpy.frombuffer(str[start:end], dtype=numpy.uint16, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.monitoring_case_number_outputs_flags = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
      self.monitoring_case_number_outputs_flags = list(map(bool, self.monitoring_case_number_outputs_flags))
      _x = self
      start = end
      end += 17
      (_x.sleep_mode_output, _x.sleep_mode_output_valid, _x.error_flag_contamination_warning, _x.error_flag_contamination_error, _x.error_flag_manipulation_error, _x.error_flag_glare, _x.error_flag_reference_contour_intruded, _x.error_flag_critical_error, _x.error_flags_are_valid, _x.linear_velocity_outputs_velocity_0, _x.linear_velocity_outputs_velocity_0_valid, _x.linear_velocity_outputs_velocity_0_transmitted_safely, _x.linear_velocity_outputs_velocity_1, _x.linear_velocity_outputs_velocity_1_valid, _x.linear_velocity_outputs_velocity_1_transmitted_safely,) = _get_struct_9Bh2Bh2B().unpack(str[start:end])
      self.sleep_mode_output_valid = bool(self.sleep_mode_output_valid)
      self.error_flag_contamination_warning = bool(self.error_flag_contamination_warning)
      self.error_flag_contamination_error = bool(self.error_flag_contamination_error)
      self.error_flag_manipulation_error = bool(self.error_flag_manipulation_error)
      self.error_flag_glare = bool(self.error_flag_glare)
      self.error_flag_reference_contour_intruded = bool(self.error_flag_reference_contour_intruded)
      self.error_flag_critical_error = bool(self.error_flag_critical_error)
      self.error_flags_are_valid = bool(self.error_flags_are_valid)
      self.linear_velocity_outputs_velocity_0_valid = bool(self.linear_velocity_outputs_velocity_0_valid)
      self.linear_velocity_outputs_velocity_0_transmitted_safely = bool(self.linear_velocity_outputs_velocity_0_transmitted_safely)
      self.linear_velocity_outputs_velocity_1_valid = bool(self.linear_velocity_outputs_velocity_1_valid)
      self.linear_velocity_outputs_velocity_1_transmitted_safely = bool(self.linear_velocity_outputs_velocity_1_transmitted_safely)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sh'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.resulting_velocity = numpy.frombuffer(str[start:end], dtype=numpy.int16, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.resulting_velocity_flags = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
      self.resulting_velocity_flags = list(map(bool, self.resulting_velocity_flags))
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_9Bh2Bh2B = None
def _get_struct_9Bh2Bh2B():
    global _struct_9Bh2Bh2B
    if _struct_9Bh2Bh2B is None:
        _struct_9Bh2Bh2B = struct.Struct("<9Bh2Bh2B")
    return _struct_9Bh2Bh2B
