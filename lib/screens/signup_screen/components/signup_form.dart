import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/build_btn.dart';
import 'package:ui_store_design/components/build_text_form_field.dart';
import 'package:ui_store_design/screens/login_screen/login.dart';
import 'package:ui_store_design/services/auth/auth.dart';

class SignUpForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    return Form(
      key: _formKey,
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
          BuildButton(
              press: () {
                if (_formKey.currentState!.validate()) {
                  print('form is validated');
                  // ref.read(authProvider.notifier).signUp();
                }
              },
              text: "SIGN UP"),
          SizedBox(
            height: 70.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 17.sp, fontFamily: "Avenir-Book"),
              ),
              GestureDetector(
                child: Text(
                  " Sign In",
                  style:
                      TextStyle(fontFamily: "Avenir-Medium", fontSize: 17.sp),
                ),
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
