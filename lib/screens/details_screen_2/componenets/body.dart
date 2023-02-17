import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/product_variation_model.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/variations_section.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/description_section.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/title_price_ratting.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/you_may_also_like_section.dart';
import 'package:ui_store_design/providers/chosen_product_state/chosen_product_notifier.dart';

//what do we want next ?
//we want a provider that checks:
//1- how many variables in the product
//2- check if all the variables are filled
//3- if it is filled we return a product otherwise returns null


//Details2_Body

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // print("This is the products which are arranged according to category and it length => ${productByCategory.length}");
    // print("This is the product attributes => ${product.attributesModel}");
    // print("This is the runtime type of options => ${product.attributesModel[0].options.runtimeType}");
    // print("This is the new variations => ${product.getOptions()}");
    // print(productByCategory);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImagesSlider(images: product.images,),
          SizedBox(
            height: 30.h,
          ),
          TitlePriceRatting(title: product.name, price: product.price.toString(), categories: product.categories.map((e) => e.name).toList(),),
          if(product.getOptions().isNotEmpty)
            Divider(
              height: 30.h,
              color: Colors.black12,
            ),
          if(product.getOptions().isNotEmpty)
            VariationsSection(product: product),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          YouMayAlsoLikeSection(product: product,),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          if(product.description.isNotEmpty)
            DescriptionSection(product: product,),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}



