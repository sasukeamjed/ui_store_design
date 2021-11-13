import 'package:flutter/material.dart';
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
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(42)),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(39),
                  ),
                  Text("Forgot Password", style: TextStyle(fontFamily: "Avenir", fontSize: getProportionateScreenWidth(34)),),
                  SizedBox(
                    height: getProportionateScreenWidth(18),
                  ),
                  Text("Please enter your email address. You will receive a link to create a new password via email.", style: TextStyle(fontFamily: "Avenir-Book", fontSize: getProportionateScreenWidth(17)),),
                  SizedBox(
                    height: getProportionateScreenWidth(60),
                  ),
                  BuildTextFormField(hint: "Email"),
                  SizedBox(
                    height: getProportionateScreenWidth(40),
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
