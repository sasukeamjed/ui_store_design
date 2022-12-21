import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/my_orders_screen/components/body.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  static String routeName = "/orders_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: CloseButton(),
      ),
      body: Body(),
    );
  }
}
