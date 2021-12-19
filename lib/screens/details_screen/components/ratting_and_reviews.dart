import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/details_screen/components/is_favorite_star.dart';

class RattingAndReviews extends StatelessWidget {
  const RattingAndReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          ...List.generate(
            5,
            (index) => IsFavoriteStar(
              isFavorite: true,
            ),
          ),
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
    );
  }
}
