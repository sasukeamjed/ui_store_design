import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/size_config.dart';

class HomeUpperHeader extends StatelessWidget {
  const HomeUpperHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/images/home/home_header.png"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HomeAppBar(),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "Black Fridays",
              style: TextStyle(
                fontFamily: "Avenir-Book",
                fontSize: 17.sp,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "Sale Up\nTo 70% Off",
              style: TextStyle(
                fontFamily: "Poppins-SemiBold",
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: SizedBox(
              width: 112.w,
              height: 50.h,
              child: TextButton(
                child: Text(
                  "Shop Now",
                  style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 15.sp),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
