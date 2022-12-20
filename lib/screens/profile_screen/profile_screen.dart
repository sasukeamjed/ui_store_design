import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/profile_screen/components/body.dart';

class ProfileScreen extends StatelessWidget{

  static String routeName = "/profile_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: CloseButton(),
      ),
      body: Body(),
    );
  }
}