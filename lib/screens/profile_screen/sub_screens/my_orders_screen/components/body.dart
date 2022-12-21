import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/components/page_title.dart';

class Body extends StatelessWidget{
  //My Orders Screen Body


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitle(),
        SizedBox(
          height: 10.w,
        ),
      ],
    );
  }
}
