import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/screens/details_screen/components/product_image_slider.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/variations_section.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/description_section.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/title_price_ratting.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/you_may_also_like_section.dart';


//Details2_Body

class Body extends ConsumerWidget {

  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    List<Product> productByCategory = ref.watch(dataProvider.notifier).filterProductsByCategory(product.categories);
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
          ProductImagesSlider(images: product.singleImages,),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Wrap(
              spacing: 10.w,
              runSpacing: 10.w,
              children: product.thumbnailImages.map((thumbnailImage){
                return Container(
                  height: 35.h,
                  width: 25.w,
                  child: Image.network(thumbnailImage),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TitlePriceRatting(title: product.title, price: product.price.toString(), categories: product.categories.map((e) => e.categoryName).toList(),),
          if(product.getOptions().isNotEmpty)
            Divider(
              height: 30.h,
              color: Colors.black12,
            ),
          if(product.getOptions().isNotEmpty)
            VariationsSection(variations: product.getOptions(),),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          YouMayAlsoLikeSection(similarProducts: productByCategory,),
          Divider(
            height: 40.h,
            color: Colors.black12,
          ),
          DescriptionSection(product: product,),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}


