import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum StatusFilter{
  delivered,
  processing,
  cancelled,
  all
}

class DeliveryStatusFilter extends StatefulWidget {

  @override
  State<DeliveryStatusFilter> createState() => _DeliveryStatusFilterState();
}

class _DeliveryStatusFilterState extends State<DeliveryStatusFilter> {
  StatusFilter defaultStatus = StatusFilter.delivered;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              defaultStatus = StatusFilter.delivered;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
            child: Text(
              "Delivered",
              style: defaultStatus == StatusFilter.delivered ? TextStyle(color: Colors.white, fontFamily: "Avenir", fontSize: 14.sp) : TextStyle(color: Colors.black, fontFamily: "Avenir", fontSize: 13.sp),
            ),
            decoration: BoxDecoration(
              color: defaultStatus == StatusFilter.delivered ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(15.w),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              defaultStatus = StatusFilter.processing;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
            child: Text(
              "Processing",
              style: defaultStatus == StatusFilter.processing ? TextStyle(color: Colors.white, fontFamily: "Avenir", fontSize: 14.sp) : TextStyle(color: Colors.black, fontFamily: "Avenir", fontSize: 13.sp),
            ),
            decoration: BoxDecoration(
              color: defaultStatus == StatusFilter.processing ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(15.w),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              defaultStatus = StatusFilter.cancelled;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
            child: Text(
              "Cancelled",
              style: defaultStatus == StatusFilter.cancelled ? TextStyle(color: Colors.white, fontFamily: "Avenir", fontSize: 14.sp) : TextStyle(color: Colors.black, fontFamily: "Avenir", fontSize: 13.sp),
            ),
            decoration: BoxDecoration(
              color: defaultStatus == StatusFilter.cancelled ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(15.w),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              defaultStatus = StatusFilter.all;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
            child: Text(
              "All",
              style: defaultStatus == StatusFilter.all ? TextStyle(color: Colors.white, fontFamily: "Avenir", fontSize: 14.sp) : TextStyle(color: Colors.black, fontFamily: "Avenir", fontSize: 13.sp),
            ),
            decoration: BoxDecoration(
              color: defaultStatus == StatusFilter.all ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(15.w),
            ),
          ),
        ),
      ],
    );
  }
}
