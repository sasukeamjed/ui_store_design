import 'package:collection/collection.dart';
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

class Body extends ConsumerStatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  ConsumerState<Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> {
  int _thumbnailImageIndex = 0;

  late final PageController _pageController;


  @override
  void initState() {
    _pageController  = PageController();
    super.initState();
  }

  changeThumbIndex(index){
    setState(() {
      _thumbnailImageIndex = index;
    });
  }

  _gotToTheIndexedImage(int index){
    _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
    // _pageController.jumpToPage(index);
    changeThumbIndex(index);
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
          ProductImagesSlider(images: widget.product.singleImages, onChangeFunction: changeThumbIndex, pageController: _pageController,),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Wrap(
              spacing: 10.w,
              runSpacing: 10.w,
              children: widget.product.thumbnailImages.mapIndexed((index, thumbnailImage){
                return GestureDetector(
                  onTap: (){
                    _gotToTheIndexedImage(index);
                  },
                  child: Container(
                    height: 35.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      border: _thumbnailImageIndex == index ? Border.all(color: Colors.green.withOpacity(0.6), style: BorderStyle.solid, width: 1.5, strokeAlign: StrokeAlign.outside) : null,
                    ),
                    child: Image.network(thumbnailImage),
                  ),
                );
              }).toList(),
            ),
          ),
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
            VariationsSection(variations: widget.product.getOptions(),),
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



