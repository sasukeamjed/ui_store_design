import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/checkout_screen/components/body.dart';


class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  static String routeName = "/checkout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=> Navigator.pop(context),),
      ),
      body: Body(),
    );
  }
}