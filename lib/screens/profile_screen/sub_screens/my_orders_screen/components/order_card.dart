import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/sub_screens/order_details_screen/order_details_screen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 160.w,
        padding: EdgeInsets.all(10.w),
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
            // Text("Tracking number: IW3475453455"),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Quantity: ",
                        style: TextStyle(
                          fontFamily: "Avenir-Book",
                          fontSize: 14.sp,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      TextSpan(
                        text: "3",
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Total Amount: ",
                        style: TextStyle(
                          fontFamily: "Avenir-Book",
                          fontSize: 14.sp,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      TextSpan(
                        text: "112\$",
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                  child: Text(
                    "Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Avenir",
                        fontSize: 12.sp),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size.zero, // Set this
                    padding: EdgeInsets.symmetric(
                        horizontal: 15, vertical: 5), // and this
                    side: BorderSide(width: 1.0, color: Colors.black),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(OrderDetails.routeName);
                  },
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
            )
          ],
        ),
      ),
    );
  }
}