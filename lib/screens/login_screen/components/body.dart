import 'package:flutter/material.dart';
import 'package:ui_store_design/components/build_btn.dart';
import 'package:ui_store_design/components/build_text_form_field.dart';
import 'package:ui_store_design/screens/forgot_password_screen/forgot_password.dart';
import 'package:ui_store_design/screens/home_screen/home_screen.dart';
import 'package:ui_store_design/screens/signup_screen/signup.dart';
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
            // SizedBox(
            //   height: getProportionateScreenWidth(20),
            // ),
            CloseButton(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(42)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(15),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(5)),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(30),
                          fontFamily: "Roboto"),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(70),
                  ),
                  Form(
                    child: Column(
                      children: [
                        BuildTextFormField(
                          hint: "Email",
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(30),
                        ),
                        BuildTextFormField(
                          hint: "Password",
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(90),
                        ),
                        BuildButton(
                          press: ()=>Navigator.pushNamed(context, HomeScreen.routeName),
                          text: "LOGIN",
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(40),
                        ),
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, ForgotPasswordScreen.routeName),
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                  fontFamily: "Avenir-Book",
                                  fontSize: getProportionateScreenWidth(17)),
                            )),
                        SizedBox(
                          height: getProportionateScreenWidth(80),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: getProportionateScreenWidth(44),
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
                                  fontSize: getProportionateScreenWidth(15),
                                  color: Colors.blue),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(17),
                                  fontFamily: "Avenir-Book"),
                            ),
                            GestureDetector(
                              child: Text(" Sign Up",
                                  style: TextStyle(fontFamily: "Avenir-Medium", fontSize: getProportionateScreenWidth(17)), ),
                              onTap: ()=> Navigator.pushNamed(context, SignUpScreen.routeName),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(30),
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
