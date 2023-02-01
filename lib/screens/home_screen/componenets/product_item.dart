import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: SizedBox(
        width: 140.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  widget.product.thumbnailImages[0],
                  width: 140.w,
                  height: 140.h,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  right: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.product.isFavorited =
                            !widget.product.isFavorited;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: widget.product.isFavorited
                          ? Icon(
                              Icons.favorite,
                              size: 24.w,
                            )
                          : Icon(
                              Icons.favorite_border,
                              size: 24.w,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            AutoSizeText(
              widget.product.name,
              style: TextStyle(fontFamily: "Avenir", fontSize: 10.sp),
              // style: Theme.of(context).textTheme.labelMedium,
              maxLines: 2,
            ),
            Text(
              "\$${widget.product.price}",
              style: TextStyle(
                fontFamily: "Avenir-Book",
                fontSize: 15.sp,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
