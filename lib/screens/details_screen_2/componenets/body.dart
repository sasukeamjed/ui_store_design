import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/details_screen/components/is_favorite_star.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';

//Details2_Body

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Icon(
                  Icons.favorite,
                  size: 32.w,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "\$1,499.00",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontFamily: "Avenir-Book",
                    color: Color(0xFFFF2D55),
                  ),
                ),
              ),
              ...List.generate(
                5,
                (index) => IsFavoriteStar(
                  isFavorite: true,
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Text("Colors",),
      ],
    );
  }
}
