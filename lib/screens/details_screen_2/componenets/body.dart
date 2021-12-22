import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';

//Details2_Body

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImagesSlider(),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  "Olivia Shayn Military TV Cabinet",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontFamily: "Avenir",
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.favorite),
              )
            ],
          ),
        ),
      ],
    );
  }
}
