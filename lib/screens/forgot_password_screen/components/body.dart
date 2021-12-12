import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/build_btn.dart';
import 'package:ui_store_design/components/build_text_form_field.dart';
import 'package:ui_store_design/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CloseButton(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 42.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 39.h,
                  ),
                  Text("Forgot Password", style: TextStyle(fontFamily: "Avenir", fontSize: 34.sp),),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text("Please enter your email address. You will receive a link to create a new password via email.", style: TextStyle(fontFamily: "Avenir-Book", fontSize: 17.sp),),
                  SizedBox(
                    height: 60.h,
                  ),
                  BuildTextFormField(hint: "Email"),
                  SizedBox(
                    height: 40.h,
                  ),
                  BuildButton(press: (){}, text: "SEND")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
