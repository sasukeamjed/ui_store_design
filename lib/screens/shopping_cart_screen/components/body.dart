import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_store_design/screens/checkout_screen/checkout.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/components/cart_items.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/components/checkout_button.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/components/items_total_pricing.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/components/page_title.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  //shopping_cart body
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageTitle(),
        Divider(),
        CartItems(),
        ItemsTotalPricing(),
        CheckoutButton(
          tap: ()=> Navigator.of(context).pushNamed(Checkout.routeName),
        ),
      ],
    );
  }
}

