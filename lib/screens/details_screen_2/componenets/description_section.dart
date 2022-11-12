import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/extensions.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/screens/details_screen_2/componenets/custom_expansion_tile.dart';

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
          child: LayoutBuilder(
            builder: (context, constraints){

              print("this is the product description => ${product.description}");
              final style = TextStyle(fontSize: 17.sp, fontFamily: "Avenir-Book");
              final span = TextSpan(text: product.description, style: style);
              final tp = TextPainter(text: span, textDirection: TextDirection.ltr);
              tp.layout(maxWidth: constraints.maxWidth);
              final numLines = tp.computeLineMetrics().length;
              print("the number of lines => ${tp.computeLineMetrics()[0]}");
              if (numLines > 3) {
                return CustomExpansionTile(
                  text: product.description,
                  textStyle: TextStyle(fontSize: 17.sp, fontFamily: "Avenir-Book"),
                  iconColor: Colors.green,
                  width: constraints.maxWidth,
                );
              } else {
                return Center(child: Text(product.description, style: style));
              }

            },
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
                    child: AutoSizeText(
                      "${product.dimensions.length} x ${product.dimensions.width} x ${product.dimensions.height} cm (L x W x H)",
                      softWrap: true,
                      style: TextStyle(
                        // fontSize: 14.sp,
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
