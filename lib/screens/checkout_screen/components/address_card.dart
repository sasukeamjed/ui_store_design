import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 70.h,
      width: 310.w,
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            spreadRadius: 0.5,
            blurRadius: 8,
            color: Color(0xFFACB1C0).withOpacity(0.3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(8.w),
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: SvgPicture.asset(
                "assets/icons/home_icon_address.svg",
                color: Colors.blue,
                fit: BoxFit.fitHeight,
              )),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "658 Yost Island Apt",
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontSize: 17.sp,
                ),
              ),
              Text(
                "Seattle, US",
                style: TextStyle(
                  fontFamily: "Avenir-Book",
                  fontSize: 15.sp,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
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
    );
  }
}

