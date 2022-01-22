import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  //Body of Checkout Page
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "Checkout",
            style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 8.h),
          child: Text(
            "Shipping to",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: DottedBorder(
            color: Color(0xFF0C66FF),
            strokeWidth: 3,
            dashPattern: [12,6],
            child: Container(
              height: 70.h,
              width: 310.w,
            ),
          ),
        ),
      ],
    );
  }
}
