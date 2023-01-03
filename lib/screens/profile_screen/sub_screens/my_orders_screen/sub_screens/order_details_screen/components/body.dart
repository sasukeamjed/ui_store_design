import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/sub_screens/order_details_screen/components/cart_item_card.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/sub_screens/order_details_screen/components/order_information.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/sub_screens/order_details_screen/components/reorder_button.dart';

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
            OrderInformation(),
            SizedBox(
              height: 30.h,
            ),
            ReorderButton(),
          ],
        ),
      ),
    );
  }
}

