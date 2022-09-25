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
            GridView.builder(
              itemCount: vendor.vendorProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index){
                return Card(
                  child: Container(
                    height: 120.h,
                    width: 80.w,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
