import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/screens/login_screen/components/sign_in_form.dart';


class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        fontFamily: "Roboto",),
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  SignInForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

