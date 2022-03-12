import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_store_design/screens/checkout_screen/components/address_card.dart';
import 'package:ui_store_design/screens/checkout_screen/components/empty_address.dart';
import 'package:ui_store_design/screens/checkout_screen/components/payments_methods.dart';

class Body extends StatelessWidget {
  bool checkAddress = false;

  //Body of Checkout Page
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "Checkout",
            style: TextStyle(fontSize: 34.sp, fontFamily: "Avenir"),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 10.h),
          child: Text(
            "Shipping to",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              AddressCard(),
              EmptyAddress(),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        PaymentMethods(),
        SizedBox(
          height: 20.h,
        ),
        Container(
          padding:
              EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w, bottom: 5.h),
          height: 105.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xFFEFEFF4),
              ),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Shipping fee",
                    style: TextStyle(
                      fontFamily: "Avenir-Book",
                      fontSize: 17.sp,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  Spacer(),
                  Text(
                    " \$6.99",
                    style: TextStyle(
                      fontFamily: "Avenir-Book",
                      fontSize: 17.sp,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Sub total",
                    style: TextStyle(
                      fontFamily: "Avenir-Book",
                      fontSize: 17.sp,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  Spacer(),
                  Text(
                    " \$79.99",
                    style: TextStyle(
                      fontFamily: "Avenir-Book",
                      fontSize: 17.sp,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 17.sp,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Text(
                    " \$86.98",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 17.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.black,
            child: Center(
              child: Text("PAYMENT", style: TextStyle(fontSize: 15.sp, color: Colors.white, fontFamily: "Avenir"),),
            ),
          ),
        ),
      ],
    );
  }
}
