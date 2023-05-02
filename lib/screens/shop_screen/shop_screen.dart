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

class ShopScreen extends StatelessWidget {
  // final Vendor vendor;



  static String routeName = "/shop";
  // GlobalKey circularProgressBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final dataProducts = ref.watch(mainFilterProvider);
    // print("is Data Loading => ${ref.watch(shopScreenLoadingDataState)}");
    // print('this the width => ${circularProgressBarKey.currentContext?.size?.width}');

    // print("data loading state => ${ref.watch(mainFilterProvider.notifier).isDataLoading}");
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                ShopSliverAppBar(),

                _sliverGridViewBuilderMethod(context),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 80.h,
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 + 20.h,
              right: MediaQuery.of(context).size.width / 2 - 20.w,
              child: Consumer(
                  builder: (context, ref, child){
                    print("notifier loading state => ${ref.read(mainFilterProvider.notifier).state.loadingState}");
                    // print("provider loading state => ${ref.watch(shopScreenLoadingDataState)}");

                    return ref.watch(mainFilterProvider).loadingState ? CircularProgressIndicator() : SizedBox();
                  },
              ),
            )
            // if(ref.watch(shopScreenLoadingDataState))
            //   Positioned(
            //     top: MediaQuery.of(context).size.height / 2 + 20.h,
            //     right: MediaQuery.of(context).size.width / 2 - 20.w,
            //     child: CircularProgressIndicator(),
            //   ),
            // if(ref.watch(mainFilterProvider.notifier).isDataLoading)
            //   Positioned(
            //     top: MediaQuery.of(context).size.height / 2 + 20.h,
            //     right: MediaQuery.of(context).size.width / 2 - 20.w,
            //     child: CircularProgressIndicator(),
            //   ),

          ],
        ),
      ),
    );
  }

  Widget _sliverGridViewBuilderMethod(BuildContext context) {

    final crossAxisCount = 2;
    final crossAxisSpacing = 10.w;
    final mainAxisSpacing = 10.w;
    final childAspectRatio = 0.6;



    return Consumer(
      builder: (context, ref, child){
        final dataState = ref.watch(mainFilterProvider);
        print("grid silver is rebuilding");
        return SliverGrid.builder(
          // physics: ScrollPhysics(),
          itemCount: dataState.productsState.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            return LayoutBuilder(builder: (context, constraints) {
              return GestureDetector(
                child: ShopScreenProductItem(product: dataState.productsState[index]),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsScreen2(product: dataState.productsState[index]))),
              );
            });
          },
        );
      },
    );
  }

  Widget _gridViewBuilderMethod(BuildContext context) {

    final crossAxisCount = 2;
    final crossAxisSpacing = 10.w;
    final mainAxisSpacing = 10.w;
    final childAspectRatio = 0.6;
    final itemWidth = (MediaQuery.of(context).size.width -
            (crossAxisCount - 1) * crossAxisSpacing) /
        crossAxisCount;
    final itemHeight = itemWidth / childAspectRatio;



    return Consumer(
      builder: (context, ref, child){
        final dataState = ref.watch(mainFilterProvider);
        print("grid normal is rebuilding");
        return Container(
          height: 600,
          child: GridView.builder(
            // physics: ScrollPhysics(),
            itemCount: dataState.productsState.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, index) {
              return LayoutBuilder(builder: (context, constraints) {
                return GestureDetector(
                  child: ShopScreenProductItem(product: dataState.productsState[index]),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen2(product: dataState.productsState[index]))),
                );
              });
            },
          ),
        );
      },
    );
  }
}
