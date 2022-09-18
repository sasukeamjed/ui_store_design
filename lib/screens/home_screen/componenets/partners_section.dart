import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/home_screen/componenets/vendor_item.dart';

class PartnersSection extends StatelessWidget {
  const PartnersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Partner Vendors",
            style: TextStyle(
              fontFamily: "Avenir",
              fontSize: 24.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          VendorItem(),
        ],
      ),
    );
  }
}

