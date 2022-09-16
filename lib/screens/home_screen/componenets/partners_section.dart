import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartnersSection extends StatelessWidget {
  const PartnersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Partner Vendors",
            style: TextStyle(
              fontFamily: "Avenir",
              fontSize: 24.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 120.h,
            width: 150.w,
            color: Color(0xfff5f5f5),
            child: Image.asset(
              "assets/images/splash_screen/logo-small.png",
              height: 80,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}
