import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/providers/search_providers.dart';
import 'package:ui_store_design/screens/details_screen_2/details_screen_2.dart';
import 'package:ui_store_design/screens/vendor_screen/vendor_screen.dart';
import 'package:ui_store_design/services/data/data.dart';

class SearchingPage extends ConsumerWidget {
  // final String _searchValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(productsSearchDataProvider);
    List<Vendor>? vendors = ref.watch(vendorsSearchDataProvider);
    String searchQuery = ref.watch(searchQueryProvider);
    print("The search query is => ${ref.watch(searchQueryProvider)}");
    print("This is the results of searching functions => ${[...products, ...?vendors]}");

    return Container(
      color: Color(0xFFededed),
      height: double.infinity,
      width: double.infinity,
      child: products.isNotEmpty || vendors!.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(vendors!.isNotEmpty)
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: vendors.length,
                        itemBuilder: (context, index) {
                          print("This list search length is => ${[...products, ...?vendors].length}");
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> VendorScreen(vendor: vendors[index])));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              // height: 120.h,
                              width: 80.w,
                              // color: Colors.green,
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(child: Image.network(vendors[index].vendorShopLogo)),
                                    Flexible(child: AutoSizeText(vendors[index].vendorShopName, textAlign: TextAlign.center,))
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                if(vendors.isNotEmpty)
                  Divider(),
                SizedBox(
                  height: 20.h,
                ),
                Flexible(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Image.network(products[index].images[0]),
                            title: Row(
                              children: [
                                Text(products[index].title),
                                Spacer(),
                                Text(products[index].price.toString() + " OMR")
                              ],
                            ),
                            // subtitle: Text(products[index].price.toString()),
                            subtitle: Text(products[index].shortDescription),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailsScreen2(product: products[index])));
                            },
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(searchQuery.isNotEmpty && (products.isEmpty && vendors.isEmpty))
                  Text("No Results Found For This Query..."),
                if (searchQuery.isEmpty)
                  Text("Search for your shop name or your product..."),
              ],
            ),
    );
  }
}
