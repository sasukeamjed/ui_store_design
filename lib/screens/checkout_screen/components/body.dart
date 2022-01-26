import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {


  bool checkAddress = true;

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
          child: checkAddress ? EmptyAddress() : SizedBox(),
        ),
      ],
    );
  }
}

class EmptyAddress extends StatelessWidget {
  const EmptyAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Color(0xFF0C66FF).withOpacity(0.9),
      strokeWidth: 3,
      dashPattern: [12, 6],
      child: Container(
        height: 70.h,
        width: 310.w,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text("Add your address here", style: TextStyle(fontFamily: "Avenir-Book", fontSize: 14.sp, color: Colors.black.withOpacity(0.4),),),
              Icon(Icons.add, color: Colors.black.withOpacity(0.4),),
            ],
          ),
        ),
      ),
    );
  }
}
