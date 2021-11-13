import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/welcome_screen/components/body.dart';
import 'package:ui_store_design/size_config.dart';

class WelcomeScreen extends StatelessWidget {

  static String routeName = "/welcome";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
