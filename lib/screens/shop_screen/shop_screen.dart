import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/providers/choose_filter_state_provider.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/providers/filter_provider.dart';
import 'package:ui_store_design/providers/shop_page_provider/state/shop_page_state.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/shop_screen/components/shop_screen_product_item.dart';
import 'package:ui_store_design/screens/shop_screen/components/shop_sliver_appbar.dart';


class ShopScreen extends StatelessWidget {
  // GlobalKey circularProgressBarKey = GlobalKey();

  static String routeName = "/shop";
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

                SliverProductsGrid(),

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

                    // print("provider loading state => ${ref.watch(shopScreenLoadingDataState)}");

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

class SliverProductsGrid extends ConsumerStatefulWidget {
  const SliverProductsGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<SliverProductsGrid> createState() => _SliverProductsGridState();
}

class _SliverProductsGridState extends ConsumerState<SliverProductsGrid> {

  @override
  void initState() {
    ref.read(productsProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsProvider);
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
    );;
  }
}



