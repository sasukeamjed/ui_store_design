import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/providers/filter_provider.dart';

import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/shop_screen/components/shop_screen_product_item.dart';
import 'package:ui_store_design/screens/shop_screen/components/shop_sliver_appbar.dart';

import 'components/sliver_products_grid.dart';


class ShopScreen extends StatelessWidget {
  // GlobalKey circularProgressBarKey = GlobalKey();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static String routeName = "/shop";
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        body: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                ShopSliverAppBar(),

                SliverProductsGrid(),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 + 20.h,
              right: MediaQuery.of(context).size.width / 2 - 20.w,
              child: Consumer(
                  builder: (context, ref, child){
                    return ref.watch(shopScreenLoadingDataState) ? CircularProgressIndicator() : SizedBox();
                  },
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _sliverGridViewBuilderMethod() {



    return Consumer(
      builder: (context, ref, child){
        // final DataLoaded productsData = ref.read(productsDataProvider) as DataLoaded;
        // final List<Product> products = ref.read(mainFilterProvider(productsData.products)).productsState;
        final products = ref.watch(productsProvider);
        // final dataState = ref.watch(sortedProducts);
        // final dataState = ref.watch(filterChangeNotifier);
        // dataState.productsState.forEach((element) {
        //   print(element.name);
        // });
        return SliverGrid.builder(
          // physics: ScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.w,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            return LayoutBuilder(builder: (context, constraints) {
              return GestureDetector(
                child: ShopScreenProductItem(product: products[index]),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsScreen2(product: products[index]))),
              );
            });
          },
        );
      },
    );
  }
}



