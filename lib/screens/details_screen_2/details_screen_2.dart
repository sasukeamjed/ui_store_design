import 'package:badges/badges.dart' as BadgeMark;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/providers/cart_state_notifier.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/add_cart_bar.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/body.dart';
import 'package:ui_store_design/screens/search_page/search_page.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/shopping_cart.dart';

class DetailsScreen2 extends StatelessWidget {
  //ToDo: change the appbar heart icon to cart icon
  const DetailsScreen2({required this.product});

  static String routeName = "/details2";
  final Product product;

  Widget _shoppingCartBadge() {
    return Consumer(builder: (context, ref, child) {

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
    });
  }

  @override
  Widget build(BuildContext context) {
    print(product.dimensions);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.2,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
          ),
          SizedBox(
            width: 10.w,
          ),
          _shoppingCartBadge(),
          SizedBox(
            width: 20.w,
          ),
        ],
        title: FittedBox(
          child: Text(
            product.title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Body(
        product: product,
      ),
      bottomNavigationBar: AddToCartBar(
        product: product,
      ),
    );
  }
}
