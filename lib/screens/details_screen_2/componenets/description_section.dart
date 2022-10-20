import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/extensions.dart';
import 'package:ui_store_design/models/product_model.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({Key? key, required this.product}) : super(key: key);

  final Product product;



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "Description",
            style: TextStyle(fontSize: 20.sp, fontFamily: "Avenir"),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(product.description,
            style: TextStyle(fontSize: 17.sp, fontFamily: "Avenir-Book"),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Sku:",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${product.sku}",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Categories:",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(product.categories.map((category) => category.categoryName).toList().join(","),
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       child: Text(
              //         "Tags:",
              //         style: TextStyle(
              //           fontSize: 17.sp,
              //           fontFamily: "Avenir-Book",
              //           color: Colors.black.withOpacity(0.4),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Text(
              //         "#furniture, #table",
              //         style: TextStyle(
              //           fontSize: 17.sp,
              //           fontFamily: "Avenir-Book",
              //           color: Colors.black,
              //         ),
              //         maxLines: 1,
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Dimensions:",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${product.dimensions.length ?? "NA" } x ${product.dimensions.width ?? "NA" } x ${product.dimensions.height ?? "NA" } cm (L x W x H)",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: "Avenir-Book",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
