import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_store_design/screens/checkout_screen/components/address_card.dart';
import 'package:ui_store_design/screens/checkout_screen/components/empty_address.dart';

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
          padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 8.h),
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
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Payment method", style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 234.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFEFEFF4),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              height: 49.w,
                              width: 49.w,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F2F6),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset("assets/icons/vis_svg_icon.svg", width: 30.w, height: 23.w,fit: BoxFit.none,),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

