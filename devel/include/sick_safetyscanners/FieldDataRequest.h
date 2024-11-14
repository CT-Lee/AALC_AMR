// Generated by gencpp from file sick_safetyscanners/FieldDataRequest.msg
// DO NOT EDIT!


#ifndef SICK_SAFETYSCANNERS_MESSAGE_FIELDDATAREQUEST_H
#define SICK_SAFETYSCANNERS_MESSAGE_FIELDDATAREQUEST_H


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
struct FieldDataRequest_
{
  typedef FieldDataRequest_<ContainerAllocator> Type;

  FieldDataRequest_()
    {
    }
  FieldDataRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> const> ConstPtr;

}; // struct FieldDataRequest_

typedef ::sick_safetyscanners::FieldDataRequest_<std::allocator<void> > FieldDataRequest;

typedef boost::shared_ptr< ::sick_safetyscanners::FieldDataRequest > FieldDataRequestPtr;
typedef boost::shared_ptr< ::sick_safetyscanners::FieldDataRequest const> FieldDataRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace sick_safetyscanners

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sick_safetyscanners/FieldDataRequest";
  }

  static const char* value(const ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FieldDataRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::sick_safetyscanners::FieldDataRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // SICK_SAFETYSCANNERS_MESSAGE_FIELDDATAREQUEST_H
