import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/providers/filter_provider.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/shop_screen/components/shop_screen_product_item.dart';

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

