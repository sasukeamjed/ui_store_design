import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/shipping_address_screen/components/body.dart';


class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  static String routeName = "/address";


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
