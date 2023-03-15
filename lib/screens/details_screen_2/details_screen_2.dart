
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/cart_icon_with_badge.dart';
import 'package:ui_store_design/models/product_model.dart';

import 'package:ui_store_design/screens/details_screen_2/componenets/add_cart_bar.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/body.dart';
import 'package:ui_store_design/screens/search_page/search_delegate_custom_class.dart';
import 'package:ui_store_design/screens/search_page/search_page.dart';


class DetailsScreen2 extends StatelessWidget {
  //ToDo: change the appbar heart icon to cart icon
  const DetailsScreen2({required this.product});

  static String routeName = "/details2";
  final Product product;



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
              customShowSearchFunction(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
          ),
          SizedBox(
            width: 10.w,
          ),
          CartIconWithBadge(),
          // SizedBox(
          //   width: 20.w,
          // ),
        ],
        title: FittedBox(
          child: Text(
            product.name,
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
