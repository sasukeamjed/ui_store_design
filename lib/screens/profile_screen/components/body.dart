import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/profile_screen/components/page_title.dart';
import 'package:ui_store_design/screens/profile_screen/components/profile_components.dart';

class Body extends StatelessWidget{
  //Profile Screen Body


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitle(),
        SizedBox(
          height: 10.w,
        ),
        ProfileComponents(),
      ],
    );
  }
}