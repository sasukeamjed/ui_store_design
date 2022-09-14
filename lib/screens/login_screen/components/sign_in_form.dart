import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/build_btn.dart';
import 'package:ui_store_design/components/build_text_form_field.dart';
import 'package:ui_store_design/screens/forgot_password_screen/forgot_password.dart';
import 'package:ui_store_design/screens/home_screen/home_screen.dart';
import 'package:ui_store_design/screens/signup_screen/signup.dart';
import 'package:ui_store_design/services/auth/auth.dart';
import 'package:ui_store_design/services/auth/states/auth_state.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Form(
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
            press: () async {
              ref.read(authProvider.notifier).login();

              // print("response from login page : $res");
              // Response response = await data.fetchUser();
              // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
            text: "LOGIN",
          ),
          // state is AuthLoading ? CircularProgressIndicator() : state is AuthError ? Text("error") : Container(),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(authProvider);
              if (state is AuthInitial) {
                return Container();
              } else if (state is AuthLoading) {
                return CircularProgressIndicator();
              } else if (state is AuthLoaded) {
                // delay(context);
                Future.microtask(() => Navigator.pushReplacementNamed(
                    context, HomeScreen.routeName));
                // return HomeScreen();
              } else if (state is AuthError) {
                return Text(state.message);
              }
              return Container();
            },
          ),
          SizedBox(
            height: 40.h,
          ),
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
            child: Text(
              "Forgot your password?",
              style: TextStyle(fontFamily: "Avenir-Book", fontSize: 17.sp),
            ),
          ),
          SizedBox(
            height: 60.h,
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
                    fontFamily: "Avenir", fontSize: 15.sp, color: Colors.blue),
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
                style: TextStyle(fontSize: 17.sp, fontFamily: "Avenir-Book"),
              ),
              GestureDetector(
                child: Text(
                  " Sign Up",
                  style:
                      TextStyle(fontFamily: "Avenir-Medium", fontSize: 17.sp),
                ),
                onTap: () =>
                    Navigator.pushNamed(context, SignUpScreen.routeName),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
