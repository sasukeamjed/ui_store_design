import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/screens/details_screen/details.dart';
import 'package:ui_store_design/screens/home_screen/componenets/best_seller_item.dart';
import 'package:ui_store_design/screens/home_screen/componenets/home_upper_header.dart';
import 'package:ui_store_design/screens/home_screen/componenets/new_arrivals.dart';
import 'package:ui_store_design/screens/home_screen/componenets/vendors_section.dart';
import 'package:ui_store_design/size_config.dart';


//Body of HomeScreen
class Body extends StatefulWidget {
  final Function stopSearchCallBack;
  Body({required this.stopSearchCallBack});
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, Map<String, dynamic>> categories = {
    "Chairs": {
      "category_id": "1",
      "items_numbers": 1126,
      "img": "assets/images/categories/category_chairs.png"
    },
    "Tables": {
      "category_id": "2",
      "items_numbers": 442,
      "img": "assets/images/categories/categories_tables.png"
    },
    "Sofa": {
      "category_id": "3",
      "items_numbers": 1865,
      "img": "assets/images/categories/categories_sofas.png"
    },
  };

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollStartNotification>(
      //Listen for Scroll Notifications and call stopSearchCallBack method when it dose
      onNotification: (ScrollNotification scrollNotification){
        if(scrollNotification is ScrollStartNotification){
          widget.stopSearchCallBack();
        }
        return false;
      },
      child: SafeArea(
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
      ),
    );
  }
}

