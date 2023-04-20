import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/providers/choose_filter_state_provider.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/shop_screen/components/shop_screen_product_item.dart';
import 'package:ui_store_design/screens/shop_screen/components/shop_sliver_appbar.dart';
import 'package:ui_store_design/services/auth/states/auth_state.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';

import '../../models/product_model.dart';

class ShopScreen extends ConsumerWidget {
  // final Vendor vendor;

  const ShopScreen({Key? key}) : super(key: key);

  static String routeName = "/shop";

  @override
  Widget build(BuildContext context, ref) {
    final List<Product> dataProducts = ref.watch(mainFilterProvider);

    // print("data loading state => ${ref.watch(mainFilterProvider.notifier).isDataLoading}");
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverStack(
              positionedAlignment: Alignment.center,
              children: [
                SliverPositioned.fill(child: Text("child")),
              ],
            ),
            MultiSliver(
              children: [
                // Text("child"),
                SliverStack(
                  positionedAlignment: Alignment.center,
                  children: [
                    SliverPositioned.fill(child: Container(color: Colors.green,)),
                    Container(
                      color: Colors.brown,
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // body: CustomScrollView(
        //   slivers: <Widget>[
        //     // ShopSliverAppBar(),
        //     SliverStack(
        //       // defaults to false
        //       children: <Widget>[
        //         Text("fish"),
        //       ],
        //     ),
        //     // SliverToBoxAdapter(
        //     //   child: Stack(
        //     //     alignment: Alignment.center,
        //     //      // defaults to false
        //     //     children: <Widget>[
        //     //       Positioned.fill(child: Container(
        //     //         color: Colors.black,
        //     //       ),),
        //     //       Container(
        //     //         height: 100,
        //     //         width: 100,
        //     //         color: Colors.orange,
        //     //       ),
        //     //     ],
        //     //   ),
        //     // ),
        //     //
        //     // SliverToBoxAdapter(
        //     //   child: SizedBox(
        //     //     height: 80.h,
        //     //   ),
        //     // ),
        //   ],
        // ),
      ),
    );
  }

  Widget _sliverGridViewBuilderMethod(
      BuildContext context, List<Product> products) {
    final itemCount = products.length;
    final crossAxisCount = 2;
    final crossAxisSpacing = 10.w;
    final mainAxisSpacing = 10.w;
    final childAspectRatio = 0.6;
    final itemWidth = (MediaQuery.of(context).size.width -
            (crossAxisCount - 1) * crossAxisSpacing) /
        crossAxisCount;
    final itemHeight = itemWidth / childAspectRatio;
    final rowCount = (itemCount / crossAxisCount).ceil();
    final height = rowCount * itemHeight + (rowCount - 1) * mainAxisSpacing;

    return SliverGrid.builder(
      // physics: ScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return LayoutBuilder(builder: (context, constraints) {
          return GestureDetector(
            child: ShopScreenProductItem(product: products[index]),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen2(product: products[index]))),
          );
        });
      },
    );
  }

  Widget _gridViewBuilderMethod(BuildContext context, List<Product> products) {
    final itemCount = products.length;
    final crossAxisCount = 2;
    final crossAxisSpacing = 10.w;
    final mainAxisSpacing = 10.w;
    final childAspectRatio = 0.6;
    final itemWidth = (MediaQuery.of(context).size.width -
            (crossAxisCount - 1) * crossAxisSpacing) /
        crossAxisCount;
    final itemHeight = itemWidth / childAspectRatio;
    final rowCount = (itemCount / crossAxisCount).ceil();
    final height = rowCount * itemHeight + (rowCount - 1) * mainAxisSpacing;

    return Container(
      height: 600,
      child: GridView.builder(
        // physics: ScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) {
          return LayoutBuilder(builder: (context, constraints) {
            return GestureDetector(
              child: ShopScreenProductItem(product: products[index]),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen2(product: products[index]))),
            );
          });
        },
      ),
    );
  }
}
