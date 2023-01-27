import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/profile_screen/sub_screens/shipping_address_screen/components/page_title.dart';

class Body extends StatelessWidget {
  //Shipping Address Body
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTitle(),
      ],
    );
  }
}
