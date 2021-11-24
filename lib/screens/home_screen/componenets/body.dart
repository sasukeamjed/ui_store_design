import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_store_design/models/product.dart';
import 'package:ui_store_design/screens/home_screen/componenets/home_upper_header.dart';
import 'package:ui_store_design/screens/home_screen/componenets/new_arrivals.dart';
import 'package:ui_store_design/size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Map<String, Map<String, dynamic>> categories = {
    "Chairs": {
      "category_id": "1",
      "items_numbers": 1126,
      "img": "assets/images/categories/category_chairs.png"
    },
    "Tables": {
      "category_id": "2",
      "items_numbers": 442,
      "img": "assets/images/categories/categories_tables.png"
    },
    "Sofa": {
      "category_id": "3",
      "items_numbers": 1865,
      "img": "assets/images/categories/categories_sofas.png"
    },
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeUpperHeader(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            NewArrivalsSection(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
              ),
              child: Row(
                children: [
                  Text(
                    "Best Sellers",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: getProportionateScreenWidth(24),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Show all",
                    style: TextStyle(
                        fontFamily: "Avenir-Book",
                        fontSize: getProportionateScreenWidth(15)),
                  ),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: getProportionateScreenWidth(10), bottom: getProportionateScreenWidth(10), left: getProportionateScreenWidth(20),),
              shrinkWrap: true,
              itemCount: bestSellersProducts.length,
              itemBuilder: (context, index) {
                return BestSellerItem(product: bestSellersProducts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(104),
      width: double.infinity,
      decoration: BoxDecoration(
      ),
      child: Row(
        children: [
          Image.asset(product.img, height: getProportionateScreenWidth(88), width: getProportionateScreenWidth(88)),
          SizedBox(
            width: getProportionateScreenWidth(15),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.20),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontSize: getProportionateScreenWidth(17)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("\$${product.price}", style: TextStyle(fontSize: getProportionateScreenWidth(15), fontFamily: "Avenir-Book", color: Colors.black.withOpacity(0.4)),),
                ],
              ),
            ),
          ),
        ],
      ),
      // child: Row(
      //   mainAxisSize: MainAxisSize.max,
      //   children: [
      //     Image.asset(product.img, height: getProportionateScreenWidth(88), width: getProportionateScreenWidth(88)),
      //     Expanded(
      //       child: Padding(
      //         padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
      //         child: Container(
      //           decoration: BoxDecoration(
      //             border: Border(
      //               bottom: BorderSide(
      //                 width: 2,
      //               ),
      //             ),
      //           ),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Align(child: Text(product.title, style: TextStyle(fontSize: getProportionateScreenWidth(17)),), alignment: Alignment.centerLeft,),
      //               SizedBox(
      //                 height: 7,
      //               ),
      //               // Text("\$${product.price}", style: TextStyle(fontSize: getProportionateScreenWidth(15), fontFamily: "Avenir-Book", color: Colors.black.withOpacity(0.4)),),
      //               Spacer(),
      //               // Container(
      //               //   height: 2,
      //               //   width: 100,
      //               //   color: Colors.black,
      //               // ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
