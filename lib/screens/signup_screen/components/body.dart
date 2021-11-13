import 'package:flutter/material.dart';
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
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(42)),
              child: Column(
                children: [
                  Text("Personal details", style: TextStyle(fontFamily: "Avenir", fontSize: getProportionateScreenWidth(34)),),
                  SizedBox(
                    height: getProportionateScreenWidth(23),
                  ),
                  Form(
                    child: Column(
                      children: [
                        BuildTextFormField(hint: "Email"),
                        SizedBox(
                          height: getProportionateScreenWidth(31),
                        ),
                        BuildTextFormField(hint: "Password"),
                        SizedBox(
                          height: getProportionateScreenWidth(31),
                        ),
                        BuildTextFormField(hint: "Phone"),
                        SizedBox(
                          height: getProportionateScreenWidth(31),
                        ),
                        BuildTextFormField(hint: "Date of birth"),
                        SizedBox(
                          height: getProportionateScreenWidth(31),
                        ),
                        BuildTextFormField(hint: "Address"),
                        SizedBox(
                          height: getProportionateScreenWidth(38),
                        ),
                        BuildButton(press: (){}, text: "SIGN UP"),
                        SizedBox(
                          height: getProportionateScreenWidth(70),
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
                              child: Text(" Sign In",
                                style: TextStyle(fontFamily: "Avenir-Medium", fontSize: getProportionateScreenWidth(17)), ),
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
