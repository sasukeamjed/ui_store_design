import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/shop_screen/components/shop_screen_product_item.dart';
import 'package:ui_store_design/screens/shop_screen/components/shop_sliver_appbar.dart';

import '../../models/product_model.dart';

class ShopScreen extends ConsumerWidget {
  // final Vendor vendor;

  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final List<Product> products = ref.watch(productsDataProvider);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            // VendorSliverAppBar(
            //   vendor: vendor,
            // ),
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
                  mainAxisSpacing: 10.w,
                  childAspectRatio: 0.6,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return LayoutBuilder(builder: (context, constraints) {
                      return GestureDetector(child: ShopScreenProductItem(product: products[index]), onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen2(product: products[index]))),);
                    });
                  },
                  childCount: products.length,
                ),
              ),
              // sliver: products.when(
              //     data: (List<Product> products){
              //       return SliverGrid(
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2,
              //           crossAxisSpacing: 10.w,
              //           mainAxisSpacing: 10.w,
              //           childAspectRatio: 0.6,
              //         ),
              //         delegate: SliverChildBuilderDelegate(
              //               (context, index) {
              //             return LayoutBuilder(builder: (context, constraints) {
              //               return GestureDetector(child: ShopScreenProductItem(vendor: vendor, index: index), onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen2(product: vendor.vendorProducts[index]))),);
              //             });
              //           },
              //           childCount: products.length,
              //         ),
              //       );
              //     },
              //     error: (err, stack){
              //       //ToDo: show snakpar error
              //     },
              //     loading: (){
              //       return SliverGrid(
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2,
              //           crossAxisSpacing: 10.w,
              //           mainAxisSpacing: 10.w,
              //           childAspectRatio: 0.6,
              //         ),
              //         delegate: SliverChildBuilderDelegate(
              //               (context, index) {
              //             return LayoutBuilder(builder: (context, constraints) {
              //               return SkeletonVendorProductItem();
              //             });
              //           },
              //           childCount: vendor.vendorProducts.length,
              //         ),
              //       );
              //     },),
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

