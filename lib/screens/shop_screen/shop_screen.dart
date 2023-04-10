import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  const ShopScreen({Key? key}) : super(key: key);

  static String routeName = "/shop";

  @override
  Widget build(BuildContext context) {
    // final List<Product> productsState = (ref.watch(productsDataProvider) as DataLoaded).products;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            ShopSliverAppBar(),
            Consumer(builder: (context, ref, child){

              final AsyncValue<List<Product>> productsAsyncValue = ref.watch(mainFilterProvider);

              return SliverToBoxAdapter(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    productsAsyncValue.when(data: (List<Product> products){
                      return SliverPadding(
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
                      );
                    }, error: (error, stack)=> Text("An Error Has Occured"), loading: ()=>Container(),),
                    CircularProgressIndicator(),
                  ],
                ),
              );

            }),
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

