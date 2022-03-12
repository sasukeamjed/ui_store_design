import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product.dart';
import 'package:ui_store_design/screens/details_screen/details.dart';
import 'package:ui_store_design/screens/home_screen/componenets/best_seller_item.dart';
import 'package:ui_store_design/screens/home_screen/componenets/home_upper_header.dart';
import 'package:ui_store_design/screens/home_screen/componenets/new_arrivals.dart';
import 'package:ui_store_design/size_config.dart';

class Body extends StatefulWidget {
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeUpperHeader(),
            SizedBox(
              height: 30.h,
            ),
            NewArrivalsSection(),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
              ),
              child: Row(
                children: [
                  Text(
                    "Best Sellers",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 24.sp,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Show all",
                    style: TextStyle(
                        fontFamily: "Avenir-Book",
                        fontSize: 15.sp),
                  ),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 20.w,),
              shrinkWrap: true,
              itemCount: bestSellersProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(child: BestSellerItem(product: bestSellersProducts[index]), onTap: ()=> Navigator.of(context).pushNamed(DetailsScreen.routeName),);
              },
            ),
          ],
        ),
      ),
    );
  }
}

