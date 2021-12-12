import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/details_screen/components/is_favorite_star.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';
import 'package:ui_store_design/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            bottom: 5.h,
            right: 20.w,
            left: 20.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Justo gravida semper",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: "Avenir"),
              ),
              Text(
                "\$24.00",
                style: TextStyle(
                    color: Color(0xFFFF2D55),
                    fontSize: 20.sp,
                    fontFamily: "Avenir-Book"),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              ...List.generate(
                  5,
                  (index) => IsFavoriteStar(
                        isFavorite: true,
                      )),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "(323 reviews)",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: "Avenir-Book",
                    color: Colors.black.withOpacity(0.4)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        ProductImagesSlider(),
        SizedBox(
          height: 5.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 15.w),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 2.5,
                      ),
                    ),
                  ),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: "Avenir",
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 48.w),
                  child: Text(
                    "Review",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: "Avenir-Roman",
                      color: Colors.black.withOpacity(0.5),
                      height: 1.5,
                    ),
                  ),
                ),
                Text(
                  "Additional information",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: "Avenir-Roman",
                    color: Colors.black.withOpacity(0.5),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          // color: Colors.black,
          color: Color(0xFFF1F2F6),
        ),
      ],
    );
  }
}
