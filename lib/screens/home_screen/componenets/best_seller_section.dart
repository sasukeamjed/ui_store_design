import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/home_screen/componenets/product_item.dart';
import 'package:ui_store_design/services/data/data.dart';

class BestSellersSection extends ConsumerWidget {
  const BestSellersSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final List<Product> products = ref.watch(dataProvider.notifier).sortProductsByTotalSales();
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Best Sellers",
                // style: TextStyle(
                //   fontFamily: "Avenir",
                //   fontSize: 24.sp,
                // ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Spacer(),
              Text(
                "Show all",
                // style: TextStyle(fontFamily: "Avenir-Book", fontSize: 15.sp),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Icon(Icons.arrow_right),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 260.h,
            child: products.isEmpty
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ProductItem(product: products[index]),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen2(product: products[index],))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

