import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/items_total_pricing.dart';
import 'package:ui_store_design/screens/checkout_screen/components/address_card.dart';
import 'package:ui_store_design/screens/checkout_screen/components/payments_methods.dart';
import 'package:ui_store_design/services/payment/create_session.dart';

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
        Align(
          child: AddressCard(),
          alignment: Alignment.center,
        ),
        // EmptyAddress(),
        SizedBox(
          height: 20.h,
        ),
        PaymentMethods(),
        SizedBox(
          height: 20.h,
        ),
        Spacer(),
        ItemsTotalPricing(),
        PaymentButton(),
      ],
    );
  }
}



