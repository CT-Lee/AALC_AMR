// Generated by gencpp from file sick_safetyscanners/ApplicationInputsMsg.msg
// DO NOT EDIT!


#ifndef SICK_SAFETYSCANNERS_MESSAGE_APPLICATIONINPUTSMSG_H
#define SICK_SAFETYSCANNERS_MESSAGE_APPLICATIONINPUTSMSG_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sick_safetyscanners
{
template <class ContainerAllocator>
struct ApplicationInputsMsg_
{
  typedef ApplicationInputsMsg_<ContainerAllocator> Type;

  ApplicationInputsMsg_()
    : unsafe_inputs_input_sources()
    , unsafe_inputs_flags()
    , monitoring_case_number_inputs()
    , monitoring_case_number_inputs_flags()
    , linear_velocity_inputs_velocity_0(0)
    , linear_velocity_inputs_velocity_0_valid(false)
    , linear_velocity_inputs_velocity_0_transmitted_safely(false)
    , linear_velocity_inputs_velocity_1(0)
    , linear_velocity_inputs_velocity_1_valid(false)
    , linear_velocity_inputs_velocity_1_transmitted_safely(false)
    , sleep_mode_input(0)  {
    }
  ApplicationInputsMsg_(const ContainerAllocator& _alloc)
    : unsafe_inputs_input_sources(_alloc)
    , unsafe_inputs_flags(_alloc)
    , monitoring_case_number_inputs(_alloc)
    , monitoring_case_number_inputs_flags(_alloc)
    , linear_velocity_inputs_velocity_0(0)
    , linear_velocity_inputs_velocity_0_valid(false)
    , linear_velocity_inputs_velocity_0_transmitted_safely(false)
    , linear_velocity_inputs_velocity_1(0)
    , linear_velocity_inputs_velocity_1_valid(false)
    , linear_velocity_inputs_velocity_1_transmitted_safely(false)
    , sleep_mode_input(0)  {
  (void)_alloc;
    }



   typedef std::vector<uint8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint8_t>> _unsafe_inputs_input_sources_type;
  _unsafe_inputs_input_sources_type unsafe_inputs_input_sources;

   typedef std::vector<uint8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint8_t>> _unsafe_inputs_flags_type;
  _unsafe_inputs_flags_type unsafe_inputs_flags;

   typedef std::vector<uint16_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint16_t>> _monitoring_case_number_inputs_type;
  _monitoring_case_number_inputs_type monitoring_case_number_inputs;

   typedef std::vector<uint8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint8_t>> _monitoring_case_number_inputs_flags_type;
  _monitoring_case_number_inputs_flags_type monitoring_case_number_inputs_flags;

   typedef int16_t _linear_velocity_inputs_velocity_0_type;
  _linear_velocity_inputs_velocity_0_type linear_velocity_inputs_velocity_0;

   typedef uint8_t _linear_velocity_inputs_velocity_0_valid_type;
  _linear_velocity_inputs_velocity_0_valid_type linear_velocity_inputs_velocity_0_valid;

   typedef uint8_t _linear_velocity_inputs_velocity_0_transmitted_safely_type;
  _linear_velocity_inputs_velocity_0_transmitted_safely_type linear_velocity_inputs_velocity_0_transmitted_safely;

   typedef int16_t _linear_velocity_inputs_velocity_1_type;
  _linear_velocity_inputs_velocity_1_type linear_velocity_inputs_velocity_1;

   typedef uint8_t _linear_velocity_inputs_velocity_1_valid_type;
  _linear_velocity_inputs_velocity_1_valid_type linear_velocity_inputs_velocity_1_valid;

   typedef uint8_t _linear_velocity_inputs_velocity_1_transmitted_safely_type;
  _linear_velocity_inputs_velocity_1_transmitted_safely_type linear_velocity_inputs_velocity_1_transmitted_safely;

   typedef uint8_t _sleep_mode_input_type;
  _sleep_mode_input_type sleep_mode_input;





  typedef boost::shared_ptr< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> const> ConstPtr;

}; // struct ApplicationInputsMsg_

typedef ::sick_safetyscanners::ApplicationInputsMsg_<std::allocator<void> > ApplicationInputsMsg;

typedef boost::shared_ptr< ::sick_safetyscanners::ApplicationInputsMsg > ApplicationInputsMsgPtr;
typedef boost::shared_ptr< ::sick_safetyscanners::ApplicationInputsMsg const> ApplicationInputsMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator1> & lhs, const ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator2> & rhs)
{
  return lhs.unsafe_inputs_input_sources == rhs.unsafe_inputs_input_sources &&
    lhs.unsafe_inputs_flags == rhs.unsafe_inputs_flags &&
    lhs.monitoring_case_number_inputs == rhs.monitoring_case_number_inputs &&
    lhs.monitoring_case_number_inputs_flags == rhs.monitoring_case_number_inputs_flags &&
    lhs.linear_velocity_inputs_velocity_0 == rhs.linear_velocity_inputs_velocity_0 &&
    lhs.linear_velocity_inputs_velocity_0_valid == rhs.linear_velocity_inputs_velocity_0_valid &&
    lhs.linear_velocity_inputs_velocity_0_transmitted_safely == rhs.linear_velocity_inputs_velocity_0_transmitted_safely &&
    lhs.linear_velocity_inputs_velocity_1 == rhs.linear_velocity_inputs_velocity_1 &&
    lhs.linear_velocity_inputs_velocity_1_valid == rhs.linear_velocity_inputs_velocity_1_valid &&
    lhs.linear_velocity_inputs_velocity_1_transmitted_safely == rhs.linear_velocity_inputs_velocity_1_transmitted_safely &&
    lhs.sleep_mode_input == rhs.sleep_mode_input;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator1> & lhs, const ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace sick_safetyscanners

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7b0ded75242c9efbfe5da85d5a0cf07c";
  }

  static const char* value(const ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7b0ded75242c9efbULL;
  static const uint64_t static_value2 = 0xfe5da85d5a0cf07cULL;
};

template<class ContainerAllocator>
struct DataType< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sick_safetyscanners/ApplicationInputsMsg";
  }

  static const char* value(const ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool[] unsafe_inputs_input_sources\n"
"bool[] unsafe_inputs_flags\n"
"\n"
"uint16[] monitoring_case_number_inputs\n"
"bool[] monitoring_case_number_inputs_flags\n"
"\n"
"int16 linear_velocity_inputs_velocity_0\n"
"bool linear_velocity_inputs_velocity_0_valid\n"
"bool linear_velocity_inputs_velocity_0_transmitted_safely\n"
"\n"
"int16 linear_velocity_inputs_velocity_1\n"
"bool linear_velocity_inputs_velocity_1_valid\n"
"bool linear_velocity_inputs_velocity_1_transmitted_safely\n"
"\n"
"uint8 sleep_mode_input\n"
"\n"
;
  }

  static const char* value(const ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.unsafe_inputs_input_sources);
      stream.next(m.unsafe_inputs_flags);
      stream.next(m.monitoring_case_number_inputs);
      stream.next(m.monitoring_case_number_inputs_flags);
      stream.next(m.linear_velocity_inputs_velocity_0);
      stream.next(m.linear_velocity_inputs_velocity_0_valid);
      stream.next(m.linear_velocity_inputs_velocity_0_transmitted_safely);
      stream.next(m.linear_velocity_inputs_velocity_1);
      stream.next(m.linear_velocity_inputs_velocity_1_valid);
      stream.next(m.linear_velocity_inputs_velocity_1_transmitted_safely);
      stream.next(m.sleep_mode_input);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ApplicationInputsMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sick_safetyscanners::ApplicationInputsMsg_<ContainerAllocator>& v)
  {
    s << indent << "unsafe_inputs_input_sources[]" << std::endl;
    for (size_t i = 0; i < v.unsafe_inputs_input_sources.size(); ++i)
    {
      s << indent << "  unsafe_inputs_input_sources[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.unsafe_inputs_input_sources[i]);
    }
    s << indent << "unsafe_inputs_flags[]" << std::endl;
    for (size_t i = 0; i < v.unsafe_inputs_flags.size(); ++i)
    {
      s << indent << "  unsafe_inputs_flags[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.unsafe_inputs_flags[i]);
    }
    s << indent << "monitoring_case_number_inputs[]" << std::endl;
    for (size_t i = 0; i < v.monitoring_case_number_inputs.size(); ++i)
    {
      s << indent << "  monitoring_case_number_inputs[" << i << "]: ";
      Printer<uint16_t>::stream(s, indent + "  ", v.monitoring_case_number_inputs[i]);
    }
    s << indent << "monitoring_case_number_inputs_flags[]" << std::endl;
    for (size_t i = 0; i < v.monitoring_case_number_inputs_flags.size(); ++i)
    {
      s << indent << "  monitoring_case_number_inputs_flags[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.monitoring_case_number_inputs_flags[i]);
    }
    s << indent << "linear_velocity_inputs_velocity_0: ";
    Printer<int16_t>::stream(s, indent + "  ", v.linear_velocity_inputs_velocity_0);
    s << indent << "linear_velocity_inputs_velocity_0_valid: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.linear_velocity_inputs_velocity_0_valid);
    s << indent << "linear_velocity_inputs_velocity_0_transmitted_safely: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.linear_velocity_inputs_velocity_0_transmitted_safely);
    s << indent << "linear_velocity_inputs_velocity_1: ";
    Printer<int16_t>::stream(s, indent + "  ", v.linear_velocity_inputs_velocity_1);
    s << indent << "linear_velocity_inputs_velocity_1_valid: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.linear_velocity_inputs_velocity_1_valid);
    s << indent << "linear_velocity_inputs_velocity_1_transmitted_safely: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.linear_velocity_inputs_velocity_1_transmitted_safely);
    s << indent << "sleep_mode_input: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.sleep_mode_input);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SICK_SAFETYSCANNERS_MESSAGE_APPLICATIONINPUTSMSG_H
