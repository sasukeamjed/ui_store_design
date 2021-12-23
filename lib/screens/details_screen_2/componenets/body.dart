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
        Divider(
          height: 30.h,
          color: Colors.black12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Colors",
                style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(6, (index) => ColorCircle(color: colors[index],)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 40.h,
          color: Colors.black12,
        ),
        Row(
          children: [
            Text(
              "You may also like",
              style: TextStyle(
                fontFamily: "Avenir",
                fontSize: 20.sp,
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
        )
      ],
    );
  }
}

List<Color> colors = [Color(0xFFDDB692), Color(0xFF007AFF), Color(0xFFFF9500), Color(0xFFFF2D55), Color(0xFF5856D6), Color(0xFFE5E5EA)];

class ColorCircle extends StatelessWidget {
  const ColorCircle({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.w,
      width: 44.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
