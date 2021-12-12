import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/size_config.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key? key, required this.press, required this.text,
  }) : super(key: key);

  final GestureTapCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44.h,
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Avenir",
              fontSize: 15.sp),
        ),
        onPressed: press,
      ),
    );
  }
}
