import 'package:flutter/material.dart';
import 'package:ui_store_design/size_config.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F0F0),
        elevation: 0.0,
        leading: IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: Icon(Icons.arrow_back)),
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
        title: Text("Lambs", style: TextStyle(color: Colors.black, ),),
        centerTitle: true,
      ),
    );
  }
}
