import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/details_screen/components/is_favorite_star.dart';

class TitlePriceRatting extends StatelessWidget {
  const TitlePriceRatting({Key? key, required this.title, required this.price}) : super(key: key);

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: AutoSizeText(
                  title,
                  maxLines: 2,
                  // maxFontSize: 28.sp,
                  style: TextStyle(
                    fontSize: 24.sp,
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
                  "$price OMR",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontFamily: "Avenir-Book",
                    color: Color(0xFFFF2D55),
                  ),
                ),
              ),
              // ...List.generate(
              //   5,
              //       (index) => IsFavoriteStar(
              //     isFavorite: true,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
