import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/home_screen/componenets/best_seller_section.dart';
import 'package:ui_store_design/screens/home_screen/componenets/home_upper_header.dart';
import 'package:ui_store_design/screens/home_screen/componenets/new_arrivals.dart';
import 'package:ui_store_design/screens/home_screen/componenets/vendors_section.dart';



//Body of HomeScreen
class Body extends StatefulWidget {

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeUpperHeader(),
            SizedBox(
              height: 30.h,
            ),
            VendorsSection(),
            SizedBox(
              height: 30.h,
            ),
            NewArrivalsSection(),
            SizedBox(
              height: 30.h,
            ),
            BestSellersSection(),
          ],
        ),
      ),
    );
  }
}

