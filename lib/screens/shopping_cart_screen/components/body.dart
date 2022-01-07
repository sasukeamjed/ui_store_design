import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Shopping Cart",
            style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "4 items",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
          //ToDo: change the container to sizedbox widget
          Container(
            color: Colors.red,
            height: 360.h,
            child: Stack(
              children: [
                Image.asset("assets/images/cart_items/cart_item_1.jpg", height: 88.w, width: 88.w,),
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Container(
                    height: 18.w,
                    width: 18.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Center(child: Text("2", style: TextStyle(color: Colors.white, fontFamily: "Avenir-Medium", fontSize: 11.sp,),)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
