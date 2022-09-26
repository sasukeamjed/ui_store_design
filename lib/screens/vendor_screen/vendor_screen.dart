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
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 30.w,
                  childAspectRatio: 0.8,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            color: Colors.green,
                            child: Image.network(vendor.vendorProducts[index].img),
                          ),
                          Positioned(
                            bottom: -20.w,
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: FittedBox(
                                child: Padding(padding: EdgeInsets.all(10.w),
                                  child: Icon(Icons.favorite_border),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  );
                }, childCount: vendor.vendorProducts.length),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
