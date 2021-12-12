import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/build_btn.dart';
import 'package:ui_store_design/components/build_text_form_field.dart';
import 'package:ui_store_design/screens/login_screen/login.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 42.w),
              child: Column(
                children: [
                  Text("Personal details", style: TextStyle(fontFamily: "Avenir", fontSize: 34.sp),),
                  SizedBox(
                    height: 23.h,
                  ),
                  Form(
                    child: Column(
                      children: [
                        BuildTextFormField(hint: "Email"),
                        SizedBox(
                          height: 31.h,
                        ),
                        BuildTextFormField(hint: "Password"),
                        SizedBox(
                          height: 31.h,
                        ),
                        BuildTextFormField(hint: "Phone"),
                        SizedBox(
                          height: 31.h,
                        ),
                        BuildTextFormField(hint: "Date of birth"),
                        SizedBox(
                          height: 31.h,
                        ),
                        BuildTextFormField(hint: "Address"),
                        SizedBox(
                          height: 38.h,
                        ),
                        BuildButton(press: (){}, text: "SIGN UP"),
                        SizedBox(
                          height: 70.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontFamily: "Avenir-Book"),
                            ),
                            GestureDetector(
                              child: Text(" Sign In",
                                style: TextStyle(fontFamily: "Avenir-Medium", fontSize: 17.sp), ),
                              onTap: ()=> Navigator.pushNamed(context, LoginScreen.routeName),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
