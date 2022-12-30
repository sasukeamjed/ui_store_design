import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/providers/image_notifier.dart';
import 'package:ui_store_design/size_config.dart';

class ProductImagesSlider extends ConsumerStatefulWidget {
  ProductImagesSlider({
    Key? key, required this.images, required this.thumbnailImages,
  }) : super(key: key);

  final List<String> images;
  final List<String> thumbnailImages;

  @override
  ConsumerState<ProductImagesSlider> createState() => _ProductImagesSliderState();
}

class _ProductImagesSliderState extends ConsumerState<ProductImagesSlider> {
  int _currentImage = 0;

  late final PageController _pageController;

  changeThumbIndex(index){
    setState(() {
      _currentImage = index;
    });
    // ref.read(imageIndexProvider).animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
  }

  _gotToTheIndexedImage(int index){
    // _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
    // _pageController.jumpToPage(index);
    // changeThumbIndex(index);
    ref.read(imageIndexProvider).animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.ease);
  }



  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 420.h,
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                controller: ref.watch(imageIndexProvider),
                  itemCount: widget.images.length,
                  onPageChanged: (index){
                    changeThumbIndex(index);
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
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Wrap(
            spacing: 10.w,
            runSpacing: 10.w,
            children: widget.thumbnailImages.mapIndexed((index, thumbnailImage){
              return GestureDetector(
                onTap: (){
                  _gotToTheIndexedImage(index);
                },
                child: Container(
                  height: 35.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    border: _currentImage == index ? Border.all(color: Colors.green.withOpacity(0.6), style: BorderStyle.solid, width: 1.5, strokeAlign: BorderSide.strokeAlignOutside) : null,
                  ),
                  child: Image.network(thumbnailImage),
                ),
              );
            }).toList(),
          ),
        ),
      ],
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
