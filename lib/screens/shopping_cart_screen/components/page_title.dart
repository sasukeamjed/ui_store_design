import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: Container(
          // color: Colors.green,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Shopping Cart",
              style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
            ),
          ),
        ),
      ),
    );
  }
}