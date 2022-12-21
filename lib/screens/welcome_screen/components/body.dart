import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/login_screen/login.dart';
import 'package:ui_store_design/screens/signup_screen/signup.dart';
import 'package:ui_store_design/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 42.w),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/welcome_screen/welcome_screen_bg.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: 50.h,
              child: TextButton(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              child: TextButton(
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
            ),
            SizedBox(
              height: 82.h,
            ),
          ],
        ),
      ),
    );
  }
}
