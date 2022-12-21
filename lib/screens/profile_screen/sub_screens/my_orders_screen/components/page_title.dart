import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "My Orders",
                style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
            ],
          )
        ],
      ),
    );
  }
}