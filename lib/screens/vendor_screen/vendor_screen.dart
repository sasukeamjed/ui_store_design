import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/vendor_screen/components/vendor_page_product_item.dart';
import 'package:ui_store_design/screens/vendor_screen/components/vendor_sliver_appbar.dart';

import '../../models/product_model.dart';

class VendorScreen extends ConsumerWidget {
  final Vendor vendor;

  const VendorScreen({Key? key, required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final AsyncValue<List<Product>> products = ref.watch(productsByVendorNotifier(vendor.vendorId.toString()));
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
              sliver: products.when(
                  data: (List<Product> products){
                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.w,
                        childAspectRatio: 0.6,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return LayoutBuilder(builder: (context, constraints) {
                            return GestureDetector(child: VendorPageProductItem(vendor: vendor, index: index), onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen2(product: vendor.vendorProducts[index]))),);
                          });
                        },
                        childCount: vendor.vendorProducts.length,
                      ),
                    );
                  },
                  error: (err, stack){
                    //ToDo: show snakpar error
                  },
                  loading: (){
                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.w,
                        childAspectRatio: 0.6,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return LayoutBuilder(builder: (context, constraints) {
                            return SkeletonVendorProductItem();
                          });
                        },
                        childCount: vendor.vendorProducts.length,
                      ),
                    );
                  },),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 80.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

