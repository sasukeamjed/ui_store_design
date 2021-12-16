import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductMainTitleWithPrice extends StatelessWidget {
  const ProductMainTitleWithPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: 5.h,
        right: 20.w,
        left: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Justo gravida semper",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
          Text(
            "\$24.00",
            style: TextStyle(
                color: Color(0xFFFF2D55),
                fontSize: 20.sp,
                fontFamily: "Avenir-Book"),
          ),
        ],
      ),
    );
  }
}
