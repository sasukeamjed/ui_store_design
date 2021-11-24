import 'package:flutter/material.dart';
import 'package:ui_store_design/size_config.dart';

import 'componenets/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F0F0),
        elevation: 0.0,
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          Icon(Icons.shopping_basket_outlined),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Text("Drawer"),
          ],
        ),
      ),
      body: Body(),
    );
  }
}
