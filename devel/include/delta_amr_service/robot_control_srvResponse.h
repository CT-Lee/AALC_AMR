// Generated by gencpp from file delta_amr_service/robot_control_srvResponse.msg
// DO NOT EDIT!


#ifndef DELTA_AMR_SERVICE_MESSAGE_ROBOT_CONTROL_SRVRESPONSE_H
#define DELTA_AMR_SERVICE_MESSAGE_ROBOT_CONTROL_SRVRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace delta_amr_service
{
template <class ContainerAllocator>
struct robot_control_srvResponse_
{
  typedef robot_control_srvResponse_<ContainerAllocator> Type;

  robot_control_srvResponse_()
    : robot_running_status()  {
    }
  robot_control_srvResponse_(const ContainerAllocator& _alloc)
    : robot_running_status(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _robot_running_status_type;
  _robot_running_status_type robot_running_status;





  typedef boost::shared_ptr< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> const> ConstPtr;

}; // struct robot_control_srvResponse_

typedef ::delta_amr_service::robot_control_srvResponse_<std::allocator<void> > robot_control_srvResponse;

typedef boost::shared_ptr< ::delta_amr_service::robot_control_srvResponse > robot_control_srvResponsePtr;
typedef boost::shared_ptr< ::delta_amr_service::robot_control_srvResponse const> robot_control_srvResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator1> & lhs, const ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator2> & rhs)
{
  return lhs.robot_running_status == rhs.robot_running_status;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator1> & lhs, const ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace delta_amr_service

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ade36ca20dba09160c3384a70217e7ce";
  }

  static const char* value(const ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xade36ca20dba0916ULL;
  static const uint64_t static_value2 = 0x0c3384a70217e7ceULL;
};

template<class ContainerAllocator>
struct DataType< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "delta_amr_service/robot_control_srvResponse";
  }

  static const char* value(const ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"# Response\n"
"\n"
"string robot_running_status\n"
"\n"
;
  }

  static const char* value(const ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.robot_running_status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct robot_control_srvResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::delta_amr_service::robot_control_srvResponse_<ContainerAllocator>& v)
  {
    s << indent << "robot_running_status: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.robot_running_status);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DELTA_AMR_SERVICE_MESSAGE_ROBOT_CONTROL_SRVRESPONSE_H
