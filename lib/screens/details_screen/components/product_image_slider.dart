import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/size_config.dart';

class ProductImagesSlider extends StatefulWidget {
  ProductImagesSlider({
    Key? key, required this.images, required this.onChangeFunction, required this.pageController,
  }) : super(key: key);

  final List<String> images;
  final PageController pageController;
  final Function onChangeFunction;

  @override
  State<ProductImagesSlider> createState() => _ProductImagesSliderState();
}

class _ProductImagesSliderState extends State<ProductImagesSlider> {
  int _currentImage = 0;



  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.h,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: widget.pageController,
              itemCount: widget.images.length,
              onPageChanged: (index){
                widget.onChangeFunction(index);
                setState(() {
                  _currentImage = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.network(
                  widget.images[index],
                  fit: BoxFit.fill,
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
                  ...List.generate(widget.images.length, (index) => buildImageCircle(index: index))
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
            color: _currentImage == index ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
