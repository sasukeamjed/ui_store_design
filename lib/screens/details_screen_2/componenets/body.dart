import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/image_model.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/product_variation_model.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/variations_section.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/description_section.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/title_price_ratting.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/you_may_also_like_section.dart';
import 'package:ui_store_design/providers/chosen_product_state/chosen_product_notifier.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';

//what do we want next ?
//we want a provider that checks:
//1- how many variables in the product
//2- check if all the variables are filled
//3- if it is filled we return a product otherwise returns null

//Details2_Body

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  List<ImageModel> _getVariationsImages(){
    if(this.product.productVariations.isNotEmpty){
      List<ProductVariationModel> variations = this.product.productVariations;
      List<ImageModel> variationsImages = [];

      variations.forEach((variation) {
        variationsImages.add(variation.image);
      });

      return variationsImages;
    }



    return [];
  }

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImagesSlider(
            images: [...product.images, ..._getVariationsImages()],
          ),
          SizedBox(
            height: 30.h,
          ),
          TitlePriceRatting(
            title: product.name,
            price: product.price.toString(),
            categories: product.categories.map((e) => e.name).toList(),
          ),
          if (product.getOptions().isNotEmpty)
            Divider(
              height: 30.h,
              color: Colors.black12,
            ),
          if (product.productVariations.isNotEmpty)
            VariationsSection(product: product, images: [...product.images, ..._getVariationsImages()],),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          //You May Also Like Section
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final List<Product> relatedProducts = ref.watch(productsDataProvider.notifier).getRelatedProductsByCategory(product);
              return relatedProducts.isNotEmpty ? YouMayAlsoLikeSection(product: product,) : SizedBox();
            },
          ),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          if (product.description.isNotEmpty)
            DescriptionSection(
              product: product,
            ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
