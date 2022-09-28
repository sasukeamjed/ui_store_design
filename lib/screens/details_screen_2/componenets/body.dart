import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/components/build_btn.dart';
import 'package:ui_store_design/components/custom_expansion_tile.dart';
import 'package:ui_store_design/models/product.dart';
import 'package:ui_store_design/screens/details_screen/components/is_favorite_star.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/colors_section.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/description_section.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/similar_items_section.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/title_price_ratting.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/you_may_also_like_section.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/shopping_cart_screen/shopping_cart.dart';

//Details2_Body

class Body extends StatelessWidget {

  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImagesSlider(images: product.images,),
          SizedBox(
            height: 30.h,
          ),
          TitlePriceRatting(title: product.title, price: product.price.toString(),),
          Divider(
            height: 30.h,
            color: Colors.black12,
          ),
          ColorsSection(),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          YouMayAlsoLikeSection(),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          DescriptionSection(),
          CustomExpansionTile(
            leading: Icon(Icons.arrow_right),
            title: Text("COMPOSITION AND CARE"),
            children: [
              Text("this is the children of the expansion tile widget"),
            ],
          ),
          CustomExpansionTile(
            leading: Icon(Icons.arrow_right),
            title: Text("SHIPPING AND RETURNS"),
            children: [
              Text("this is the children of the expansion tile widget"),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:15.w),
            child: Text("Similar Items",style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),),
          ),
          SizedBox(
            height: 10.h,
          ),
          SimilarItemsSection(),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: BuildButton(press: ()=>Navigator.of(context).pushNamed(ShoppingCart.routeName), text: "ADD TO CART"),
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}


