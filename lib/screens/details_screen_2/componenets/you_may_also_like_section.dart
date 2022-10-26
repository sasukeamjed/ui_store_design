import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';

class YouMayAlsoLikeSection extends StatelessWidget {

  final List<Product> similarProducts;

  YouMayAlsoLikeSection({Key? key, required this.similarProducts});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              Text(
                "You may also like",
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontSize: 20.sp,
                ),
              ),
              Spacer(),
              Text(
                "Show all",
                style: TextStyle(fontFamily: "Avenir-Book", fontSize: 15.sp),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(similarProducts.length,
                    (index) => buildPossiblyLikedProducts(similarProducts[index].thumbnailImages[0], context, similarProducts[index])),
          ),
        ),
      ],
    );
  }

  buildPossiblyLikedProducts(String image, BuildContext context, Product product) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DetailsScreen2(product: product)));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            image,
            height: 88.w,
            width: 88.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}