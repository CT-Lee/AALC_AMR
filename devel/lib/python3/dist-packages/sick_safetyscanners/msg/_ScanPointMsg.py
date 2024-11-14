# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from sick_safetyscanners/ScanPointMsg.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ScanPointMsg(genpy.Message):
  _md5sum = "a01759b77f0ee80f572c218c25f9954e"
  _type = "sick_safetyscanners/ScanPointMsg"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float32 angle
uint16 distance
uint8 reflectivity
bool valid
bool infinite
bool glare
bool reflector
bool contamination
bool contamination_warning
"""
  __slots__ = ['angle','distance','reflectivity','valid','infinite','glare','reflector','contamination','contamination_warning']
  _slot_types = ['float32','uint16','uint8','bool','bool','bool','bool','bool','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       angle,distance,reflectivity,valid,infinite,glare,reflector,contamination,contamination_warning

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ScanPointMsg, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.angle is None:
        self.angle = 0.
      if self.distance is None:
        self.distance = 0
      if self.reflectivity is None:
        self.reflectivity = 0
      if self.valid is None:
        self.valid = False
      if self.infinite is None:
        self.infinite = False
      if self.glare is None:
        self.glare = False
      if self.reflector is None:
        self.reflector = False
      if self.contamination is None:
        self.contamination = False
      if self.contamination_warning is None:
        self.contamination_warning = False
    else:
      self.angle = 0.
      self.distance = 0
      self.reflectivity = 0
      self.valid = False
      self.infinite = False
      self.glare = False
      self.reflector = False
      self.contamination = False
      self.contamination_warning = False

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
      buff.write(_get_struct_fH7B().pack(_x.angle, _x.distance, _x.reflectivity, _x.valid, _x.infinite, _x.glare, _x.reflector, _x.contamination, _x.contamination_warning))
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
      end += 13
      (_x.angle, _x.distance, _x.reflectivity, _x.valid, _x.infinite, _x.glare, _x.reflector, _x.contamination, _x.contamination_warning,) = _get_struct_fH7B().unpack(str[start:end])
      self.valid = bool(self.valid)
      self.infinite = bool(self.infinite)
      self.glare = bool(self.glare)
      self.reflector = bool(self.reflector)
      self.contamination = bool(self.contamination)
      self.contamination_warning = bool(self.contamination_warning)
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
      buff.write(_get_struct_fH7B().pack(_x.angle, _x.distance, _x.reflectivity, _x.valid, _x.infinite, _x.glare, _x.reflector, _x.contamination, _x.contamination_warning))
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
      end += 13
      (_x.angle, _x.distance, _x.reflectivity, _x.valid, _x.infinite, _x.glare, _x.reflector, _x.contamination, _x.contamination_warning,) = _get_struct_fH7B().unpack(str[start:end])
      self.valid = bool(self.valid)
      self.infinite = bool(self.infinite)
      self.glare = bool(self.glare)
      self.reflector = bool(self.reflector)
      self.contamination = bool(self.contamination)
      self.contamination_warning = bool(self.contamination_warning)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_fH7B = None
def _get_struct_fH7B():
    global _struct_fH7B
    if _struct_fH7B is None:
        _struct_fH7B = struct.Struct("<fH7B")
    return _struct_fH7B
