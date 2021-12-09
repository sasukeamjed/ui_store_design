import 'package:flutter/material.dart';
import 'package:ui_store_design/size_config.dart';

class ProductImagesSlider extends StatefulWidget {
  ProductImagesSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductImagesSlider> createState() => _ProductImagesSliderState();
}

class _ProductImagesSliderState extends State<ProductImagesSlider> {
  int currentImage = 0;

  List<String> images = ["assets/images/dummy_product_images/light_1.jpg", "assets/images/dummy_product_images/light_2.jpg", "assets/images/dummy_product_images/light_3.jpg", "assets/images/dummy_product_images/light_4.jpg", "assets/images/dummy_product_images/light_5.jpg"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(250),
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
              itemCount: images.length,
              onPageChanged: (value){
                setState(() {
                  currentImage = value;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: getProportionateScreenWidth(250),
                );
              }
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(4, (index) => buildImageCircle(index: index))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildImageCircle({required int index}){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
      child: Opacity(
        opacity: 0.4,
        child: Container(
          height: getProportionateScreenWidth(10),
          width: getProportionateScreenWidth(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentImage == index ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
