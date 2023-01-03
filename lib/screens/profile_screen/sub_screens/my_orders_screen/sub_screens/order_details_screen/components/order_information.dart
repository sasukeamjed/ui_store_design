import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderInformation extends StatelessWidget {
  const OrderInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                        height: 28,
                      ),
                      Text("Mastercard", style: TextStyle(fontSize: 8.sp),)
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
        SizedBox(
          height: 15.h,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                "Delivery method:",
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
                "FedEx, 3 days, 15\$",
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                "Discount:",
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
                "10\%, Personal promo code",
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                "Total amount:",
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
                "133\$",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
