import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  //Order Details Body
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Order No1029304",
                style: TextStyle(fontSize: 15.sp),
              ),
              Spacer(),
              Text(
                "05-12-2019",
                style: TextStyle(
                  fontFamily: "Avenir-Book",
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Tracking number: ",
                      style: TextStyle(
                        fontFamily: "Avenir-Book",
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    TextSpan(
                      text: "IW3475453455",
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                "Delivered",
                style: TextStyle(
                    color: Colors.green, fontFamily: "Avenir", fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "3 Items",
            style: TextStyle(color: Colors.black, fontSize: 15.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 140.h,
            width: double.infinity,
            child: Card(
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      child: Image.asset(
                        "assets/images/best_sellers/best_sellers_item1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
