import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              color: Colors.green,
              child: Image.network(
                  vendor.vendorProducts[index].images[0]),
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
              vendor.vendorProducts[index].title,
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
