import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/components/body.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  static String routeName = "/shopping_cart";

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
