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


//Details2_Body

class Body extends ConsumerStatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  ConsumerState<Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> {
  int _thumbnailImageIndex = 0;


  //this method will get the crossbonding variation from the option which was
  //choosed by the user dropdowns buttons
  ProductVariationModel getTheCrossBondingVariation(Map<String, dynamic> choosenOptions){
    List<ProductVariationModel> variations = widget.product.productVariations;

    return variations.firstWhere((variation){

      print("The Cross Bonding Variation is => ${mapEquals(variation.attributes, choosenOptions)}");
      return mapEquals(variation.attributes, choosenOptions);

    }, orElse: ()=> widget.product.productVariations[0]);
  }



  @override
  void initState() {
    widget.product.productVariations.forEach((element) {
      print("product variations in product page => $element");
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    List<Product> productByCategory = ref.watch(dataProvider.notifier).filterProductsByCategory(widget.product.categories);
    // print("This is the products which are arranged according to category and it length => ${productByCategory.length}");
    // print("This is the product attributes => ${product.attributesModel}");
    // print("This is the runtime type of options => ${product.attributesModel[0].options.runtimeType}");
    // print("This is the new variations => ${product.getOptions()}");
    // print(productByCategory);

    // productByCategory.forEach((element) {
    //   print(element.id);
    // });
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImagesSlider(images: widget.product.singleImages, thumbnailImages: widget.product.thumbnailImages,),
          SizedBox(
            height: 30.h,
          ),
          TitlePriceRatting(title: widget.product.title, price: widget.product.price.toString(), categories: widget.product.categories.map((e) => e.categoryName).toList(),),
          if(widget.product.getOptions().isNotEmpty)
            Divider(
              height: 30.h,
              color: Colors.black12,
            ),
          if(widget.product.getOptions().isNotEmpty)
            VariationsSection(variations: widget.product.getOptions(), getCrossBondingVariation: getTheCrossBondingVariation),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          YouMayAlsoLikeSection(similarProducts: productByCategory,),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          DescriptionSection(product: widget.product,),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}



