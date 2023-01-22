import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryStatusFilter extends StatelessWidget {
  const DeliveryStatusFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
          child: Text(
            "Delivered",
            style: TextStyle(color: Colors.white, fontFamily: "Avenir", fontSize: 14.sp),
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15.w),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
          child: Text(
            "Processing",
            style: TextStyle(color: Colors.black, fontFamily: "Avenir", fontSize: 14.sp),
          ),
          decoration: BoxDecoration(
            // color: Colors.black,
            borderRadius: BorderRadius.circular(15.w),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
          child: Text(
            "Cancelled",
            style: TextStyle(color: Colors.black, fontFamily: "Avenir", fontSize: 14.sp),
          ),
          decoration: BoxDecoration(
            // color: Colors.black,
            borderRadius: BorderRadius.circular(15.w),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
          child: Text(
            "All",
            style: TextStyle(color: Colors.black, fontFamily: "Avenir", fontSize: 14.sp),
          ),
          decoration: BoxDecoration(
            // color: Colors.black,
            borderRadius: BorderRadius.circular(15.w),
          ),
        ),
      ],
    );
  }

}
