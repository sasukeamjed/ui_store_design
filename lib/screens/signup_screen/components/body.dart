import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/signup_screen/components/signup_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  //Body of SignUp Screen

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollNotification) {
        if (scrollNotification is ScrollStartNotification) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
        return false;
      },
      child: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CloseButton(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42.w),
                  child: Column(
                    children: [
                      Text(
                        "Personal details",
                        style: TextStyle(fontFamily: "Avenir", fontSize: 34.sp),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      SignUpForm(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
