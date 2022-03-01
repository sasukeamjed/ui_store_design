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
              PaymentMethods(),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 49.w,
                    width: 49.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F2F6),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/vis_svg_icon.svg", width: 30.w, height: 23.w,fit: BoxFit.none,),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("**** **** **** 3765", style: TextStyle(fontFamily: "SF-UI-Display-Semibold", fontSize: 17.sp),),
                      Text("VISA", style: TextStyle(fontFamily: "SF-UI-Display-Regular", fontSize: 15.sp, color: Color(0xFFBEC2CE)),),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 21.w,
                    width: 21.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: SvgPicture.asset('assets/icons/check_shipping_address_mark.svg'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 49.w,
                    width: 49.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F2F6),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/paypal-icon.svg", width: 30.w, height: 23.w,fit: BoxFit.none,),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("pfeffer_ellen@balistreri.net", style: TextStyle(fontFamily: "SF-UI-Display-Semibold", fontSize: 17.sp),),
                      Text("Paypal", style: TextStyle(fontFamily: "SF-UI-Display-Regular", fontSize: 15.sp, color: Color(0xFFBEC2CE)),),
                    ],
                  ),
                  Spacer(),
                  // Container(
                  //   height: 21.w,
                  //   width: 21.w,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.white,
                  //   ),
                  //   child: SvgPicture.asset('assets/icons/check_shipping_address_mark.svg'),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 49.w,
                    width: 49.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F2F6),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/ms_card_icon.svg", width: 30.w, height: 23.w,fit: BoxFit.none,),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("**** **** **** 8562", style: TextStyle(fontFamily: "SF-UI-Display-Semibold", fontSize: 17.sp),),
                      Text("Master Card", style: TextStyle(fontFamily: "SF-UI-Display-Regular", fontSize: 15.sp, color: Color(0xFFBEC2CE)),),
                    ],
                  ),
                  Spacer(),
                  // Container(
                  //   height: 21.w,
                  //   width: 21.w,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.white,
                  //   ),
                  //   child: SvgPicture.asset('assets/icons/check_shipping_address_mark.svg'),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

