import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/providers/cart_state_notifier.dart';
import 'package:badges/badges.dart' as BadgeMark;
import 'package:ui_store_design/screens/shopping_cart_screen/shopping_cart.dart';

class CartIconWithBadge extends StatelessWidget {
  const CartIconWithBadge({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      if(ref.watch(cartItemNotifier).isNotEmpty){
        return BadgeMark.Badge(
          position: BadgeMark.BadgePosition.topEnd(top: 0, end: 3),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeMark.BadgeAnimationType.slide,
          badgeContent: Text(
            ref.watch(cartItemNotifier).length.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
            Navigator.of(context).pushNamed(ShoppingCart.routeName);
          }),
        );
      }else{
        return IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
          Navigator.of(context).pushNamed(ShoppingCart.routeName);
        });
      }
    });
  }
}
