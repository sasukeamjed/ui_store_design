import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/sub_screens/order_details_screen/components/cart_item_card.dart';

class Body extends StatelessWidget {
  //Order Details Body
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.w),
      child: SingleChildScrollView(
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
                      color: Colors.green,
                      fontFamily: "Avenir",
                      fontSize: 12.sp),
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
            CartItemCard(),
            CartItemCard(),
            CartItemCard(),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Order Information",
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Shipping Address:",
                    style: TextStyle(
                      fontFamily: "Avenir-Book",
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "3 Newbridge Court, Chino Hills, CA 91709, United States",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Payment method:",
                    style: TextStyle(
                      fontFamily: "Avenir-Book",
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/mastercard_logo.svg",
                            width: 28,
                            height: 18,
                          ),
                          Text("Mastercard", style: TextStyle(fontSize: 12.sp),)
                        ],
                      ),
                      Text(
                        "**** **** **** 3947",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(),
            Row(),
            Row(),
          ],
        ),
      ),
    );
  }
}
