import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/build_btn.dart';
import 'package:ui_store_design/screens/details_screen/components/is_favorite_star.dart';
import 'package:ui_store_design/screens/details_screen/components/product_description_section.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';
import 'package:ui_store_design/screens/details_screen/components/product_main_title_with_price.dart';
import 'package:ui_store_design/screens/details_screen/components/ratting_and_reviews.dart';
import 'package:ui_store_design/size_config.dart';

class Body extends StatefulWidget {


  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductMainTitleWithPrice(),
        RattingAndReviews(),
        SizedBox(
          height: 20.h,
        ),
        ProductImagesSlider(),
        SizedBox(
          height: 18.h,
        ),
        ProductDescriptionSection(),

      ],
    );
  }
}



