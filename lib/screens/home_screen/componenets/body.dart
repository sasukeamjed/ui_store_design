import 'package:flutter/material.dart';
import 'package:ui_store_design/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text("Discover", style: TextStyle(fontFamily: "Avenir", fontSize: getProportionateScreenWidth(34)),),
          ],
        ),
      ),
    );
  }
}
