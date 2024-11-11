# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from delta_amr_service/delta_amr_serviceRequest.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class delta_amr_serviceRequest(genpy.Message):
  _md5sum = "4e8d5e0a421c9f98f64d5abd9fa2e5da"
  _type = "delta_amr_service/delta_amr_serviceRequest"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# Delta_AMR_Service.srv
# Request

string img_process_type_realsense 
string img_process_type_mechmind 

string robot_mov_type 
string robot_mov_point
int32 robot_mov_speed

"""
  __slots__ = ['img_process_type_realsense','img_process_type_mechmind','robot_mov_type','robot_mov_point','robot_mov_speed']
  _slot_types = ['string','string','string','string','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       img_process_type_realsense,img_process_type_mechmind,robot_mov_type,robot_mov_point,robot_mov_speed

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(delta_amr_serviceRequest, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.img_process_type_realsense is None:
        self.img_process_type_realsense = ''
      if self.img_process_type_mechmind is None:
        self.img_process_type_mechmind = ''
      if self.robot_mov_type is None:
        self.robot_mov_type = ''
      if self.robot_mov_point is None:
        self.robot_mov_point = ''
      if self.robot_mov_speed is None:
        self.robot_mov_speed = 0
    else:
      self.img_process_type_realsense = ''
      self.img_process_type_mechmind = ''
      self.robot_mov_type = ''
      self.robot_mov_point = ''
      self.robot_mov_speed = 0

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
      _x = self.img_process_type_realsense
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.img_process_type_mechmind
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.robot_mov_type
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.robot_mov_point
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.robot_mov_speed
      buff.write(_get_struct_i().pack(_x))
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
      start = end
      end += length
      if python3:
        self.img_process_type_realsense = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.img_process_type_realsense = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.img_process_type_mechmind = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.img_process_type_mechmind = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.robot_mov_type = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.robot_mov_type = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.robot_mov_point = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.robot_mov_point = str[start:end]
      start = end
      end += 4
      (self.robot_mov_speed,) = _get_struct_i().unpack(str[start:end])
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
      _x = self.img_process_type_realsense
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.img_process_type_mechmind
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.robot_mov_type
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.robot_mov_point
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.robot_mov_speed
      buff.write(_get_struct_i().pack(_x))
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
      start = end
      end += length
      if python3:
        self.img_process_type_realsense = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.img_process_type_realsense = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.img_process_type_mechmind = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.img_process_type_mechmind = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.robot_mov_type = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.robot_mov_type = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.robot_mov_point = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.robot_mov_point = str[start:end]
      start = end
      end += 4
      (self.robot_mov_speed,) = _get_struct_i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_i = None
def _get_struct_i():
    global _struct_i
    if _struct_i is None:
        _struct_i = struct.Struct("<i")
    return _struct_i
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from delta_amr_service/delta_amr_serviceResponse.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class delta_amr_serviceResponse(genpy.Message):
  _md5sum = "851a5260ab80914e72bdc2c4ecfd5cca"
  _type = "delta_amr_service/delta_amr_serviceResponse"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """
# Response

int32 human_dist

int32 robot_running_status

"""
  __slots__ = ['human_dist','robot_running_status']
  _slot_types = ['int32','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       human_dist,robot_running_status

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(delta_amr_serviceResponse, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.human_dist is None:
        self.human_dist = 0
      if self.robot_running_status is None:
        self.robot_running_status = 0
    else:
      self.human_dist = 0
      self.robot_running_status = 0

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
      _x = self
      buff.write(_get_struct_2i().pack(_x.human_dist, _x.robot_running_status))
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
      _x = self
      start = end
      end += 8
      (_x.human_dist, _x.robot_running_status,) = _get_struct_2i().unpack(str[start:end])
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
      _x = self
      buff.write(_get_struct_2i().pack(_x.human_dist, _x.robot_running_status))
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
      _x = self
      start = end
      end += 8
      (_x.human_dist, _x.robot_running_status,) = _get_struct_2i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2i = None
def _get_struct_2i():
    global _struct_2i
    if _struct_2i is None:
        _struct_2i = struct.Struct("<2i")
    return _struct_2i
class delta_amr_service(object):
  _type          = 'delta_amr_service/delta_amr_service'
  _md5sum = '5f036b9efe5e6058b93abe4b32fb58c0'
  _request_class  = delta_amr_serviceRequest
  _response_class = delta_amr_serviceResponse
