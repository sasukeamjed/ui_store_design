import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/build_btn.dart';
import 'package:ui_store_design/components/build_text_form_field.dart';
import 'package:ui_store_design/screens/forgot_password_screen/forgot_password.dart';
import 'package:ui_store_design/screens/home_screen/home_screen.dart';
import 'package:ui_store_design/screens/signup_screen/signup.dart';
import 'package:ui_store_design/services/data/data.dart';
import 'package:ui_store_design/size_config.dart';

class Body extends StatelessWidget {

  final FetchingData data = FetchingData();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: getProportionateScreenWidth(20),
            // ),
            CloseButton(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 42.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 5.w),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontFamily: "Roboto"),
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Form(
                    child: Column(
                      children: [
                        BuildTextFormField(
                          hint: "Email",
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        BuildTextFormField(
                          hint: "Password",
                        ),
                        SizedBox(
                          height: 90.h,
                        ),
                        BuildButton(
                          press: () async{
                            Response response = await data.fetchUser();
                            print(response.data);
                            // press: ()=>Navigator.pushReplacementNamed(context, HomeScreen.routeName),
                          },
                          text: "LOGIN",
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, ForgotPasswordScreen.routeName),
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                  fontFamily: "Avenir-Book",
                                  fontSize: 17.sp),
                            )),
                        SizedBox(
                          height: 80.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 44.h,
                          child: TextButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              "LOGIN WITH FACEBOOK",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 15.sp,
                                  color: Colors.blue),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
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
                              child: Text(" Sign Up",
                                  style: TextStyle(fontFamily: "Avenir-Medium", fontSize: 17.sp), ),
                              onTap: ()=> Navigator.pushNamed(context, SignUpScreen.routeName),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
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
