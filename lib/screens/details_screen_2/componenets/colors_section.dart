import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Color> colors = [
  Color(0xFFDDB692),
  Color(0xFF007AFF),
  Color(0xFFFF9500),
  Color(0xFFFF2D55),
  Color(0xFF5856D6),
  Color(0xFFE5E5EA)
];

class ColorsSection extends StatelessWidget {
  const ColorsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              ...List.generate(
                  6,
                      (index) => ColorCircle(
                    color: colors[index],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

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