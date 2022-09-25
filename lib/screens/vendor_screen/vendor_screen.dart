import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/screens/vendor_screen/components/vendor_sliver_appbar.dart';

class VendorScreen extends StatelessWidget {
  final Vendor vendor;

  const VendorScreen({Key? key, required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            VendorSliverAppBar(
              vendor: vendor,
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                top: 20.h,
                right: 20.w,
                left: 20.w,
              ),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    color: Colors.blue,
                    child: Container(
                      color: Colors.green,
                      height: 100,
                      width: 100,
                    ),
                  );
                }, childCount: vendor.vendorProducts.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
