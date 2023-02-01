import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/screens/vendor_screen/components/heart_icon.dart';

class VendorPageProductItem extends StatelessWidget {
  const VendorPageProductItem({
    Key? key,
    required this.vendor,
    required this.index,
  }) : super(key: key);

  final Vendor vendor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: OptimizedCacheImage(
                imageUrl: vendor.vendorProducts[index].thumbnailImages[0],
                placeholder: (context, url) => Container(
                  color: Colors.black.withOpacity(0.04),
                  width: 150,
                  height: 150,
                ),
              ),
              // child: Image.network(vendor.vendorProducts[index].images[0],
              // loadingBuilder: (context, child, ImageChunkEvent? loadingProgress){
              //   if (loadingProgress == null) return child;
              //   return Center(
              //     child: CircularProgressIndicator(
              //       value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded /
              //           loadingProgress.expectedTotalBytes! : null,
              //     ),
              //   );
              // },),
            ),
            //Here the categories which is a list of Category object and map it to get a list of strings names only
            ...vendor.vendorProducts[index].categories
                .map((categoryName) => Text(
              categoryName.categoryName,
              style: TextStyle(
                  fontFamily: "Avenir-Book",
                  fontSize: 12.sp,
                  color:
                  Colors.black.withOpacity(0.4)),
            ))
                .toList(),
            AutoSizeText(
              vendor.vendorProducts[index].name,
              style: TextStyle(
                  fontFamily: "Avenir", fontSize: 17.sp),
              maxLines: 2,
            ),
            Text(
              vendor.vendorProducts[index].price.toString(),
              style: TextStyle(
                  fontFamily: "Avenir-Book",
                  fontSize: 15.sp,
                  color: Colors.black.withOpacity(0.4)),
            ),
          ],
        ),
        HeartIcon(),
      ],
    );
  }
}

class SkeletonVendorProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black.withOpacity(0.04),
              width: 150,
              height: 150,
              // child: Image.network(vendor.vendorProducts[index].images[0],
              // loadingBuilder: (context, child, ImageChunkEvent? loadingProgress){
              //   if (loadingProgress == null) return child;
              //   return Center(
              //     child: CircularProgressIndicator(
              //       value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded /
              //           loadingProgress.expectedTotalBytes! : null,
              //     ),
              //   );
              // },),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 15,
              width: 50,
              color: Colors.black.withOpacity(0.04),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 30,
              width: double.infinity,
              color: Colors.black.withOpacity(0.04),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 25,
              width: 50,
              color: Colors.black.withOpacity(0.04),
            ),
          ],
        ),
        HeartIcon(),
      ],
    );
  }
}
