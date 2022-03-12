import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      width: double.infinity,
      decoration: BoxDecoration(
      ),
      child: Row(
        children: [
          Image.asset(product.img, height: 88.h, width: 88.w),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.20),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("\$${product.price}", style: TextStyle(fontSize: 15.sp, fontFamily: "Avenir-Book", color: Colors.black.withOpacity(0.4)),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
