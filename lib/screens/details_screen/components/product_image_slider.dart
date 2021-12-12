import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 250.h,
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
                  height: 250.h,
                );
              }
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
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
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Opacity(
        opacity: 0.4,
        child: Container(
          height: 10.h,
          width: 10.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentImage == index ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
