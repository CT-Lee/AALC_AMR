// Generated by gencpp from file sick_safetyscanners/OutputPathsMsg.msg
// DO NOT EDIT!


#ifndef SICK_SAFETYSCANNERS_MESSAGE_OUTPUTPATHSMSG_H
#define SICK_SAFETYSCANNERS_MESSAGE_OUTPUTPATHSMSG_H


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
struct OutputPathsMsg_
{
  typedef OutputPathsMsg_<ContainerAllocator> Type;

  OutputPathsMsg_()
    : status()
    , is_safe()
    , is_valid()
    , active_monitoring_case(0)  {
    }
  OutputPathsMsg_(const ContainerAllocator& _alloc)
    : status(_alloc)
    , is_safe(_alloc)
    , is_valid(_alloc)
    , active_monitoring_case(0)  {
  (void)_alloc;
    }



   typedef std::vector<uint8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint8_t>> _status_type;
  _status_type status;

   typedef std::vector<uint8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint8_t>> _is_safe_type;
  _is_safe_type is_safe;

   typedef std::vector<uint8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint8_t>> _is_valid_type;
  _is_valid_type is_valid;

   typedef int32_t _active_monitoring_case_type;
  _active_monitoring_case_type active_monitoring_case;





  typedef boost::shared_ptr< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> const> ConstPtr;

}; // struct OutputPathsMsg_

typedef ::sick_safetyscanners::OutputPathsMsg_<std::allocator<void> > OutputPathsMsg;

typedef boost::shared_ptr< ::sick_safetyscanners::OutputPathsMsg > OutputPathsMsgPtr;
typedef boost::shared_ptr< ::sick_safetyscanners::OutputPathsMsg const> OutputPathsMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator1> & lhs, const ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator2> & rhs)
{
  return lhs.status == rhs.status &&
    lhs.is_safe == rhs.is_safe &&
    lhs.is_valid == rhs.is_valid &&
    lhs.active_monitoring_case == rhs.active_monitoring_case;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator1> & lhs, const ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace sick_safetyscanners

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "10ce675a2a87077eb6fb8c168c348972";
  }

  static const char* value(const ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x10ce675a2a87077eULL;
  static const uint64_t static_value2 = 0xb6fb8c168c348972ULL;
};

template<class ContainerAllocator>
struct DataType< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sick_safetyscanners/OutputPathsMsg";
  }

  static const char* value(const ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool[] status\n"
"bool[] is_safe\n"
"bool[] is_valid\n"
"int32 active_monitoring_case\n"
;
  }

  static const char* value(const ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.status);
      stream.next(m.is_safe);
      stream.next(m.is_valid);
      stream.next(m.active_monitoring_case);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct OutputPathsMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sick_safetyscanners::OutputPathsMsg_<ContainerAllocator>& v)
  {
    s << indent << "status[]" << std::endl;
    for (size_t i = 0; i < v.status.size(); ++i)
    {
      s << indent << "  status[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.status[i]);
    }
    s << indent << "is_safe[]" << std::endl;
    for (size_t i = 0; i < v.is_safe.size(); ++i)
    {
      s << indent << "  is_safe[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.is_safe[i]);
    }
    s << indent << "is_valid[]" << std::endl;
    for (size_t i = 0; i < v.is_valid.size(); ++i)
    {
      s << indent << "  is_valid[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.is_valid[i]);
    }
    s << indent << "active_monitoring_case: ";
    Printer<int32_t>::stream(s, indent + "  ", v.active_monitoring_case);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SICK_SAFETYSCANNERS_MESSAGE_OUTPUTPATHSMSG_H
