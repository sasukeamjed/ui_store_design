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

class MySearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      backgroundColor: Colors.black,
      // canvasColor: Colors.black,
      primaryColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
          // labelStyle: TextStyle(fontSize: 8),
          // helperStyle: TextStyle(fontSize: 8),
          hintStyle: TextStyle(fontSize: 14.sp)),
      appBarTheme: AppBarTheme(
        // color: Colors.white,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        toolbarTextStyle: TextStyle(),
        titleTextStyle: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  String get searchFieldLabel => 'Interested on searching for something?';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = "";
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          return close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    print("The search query is => $query");

    return Consumer(
      builder: (context, ref, child) {
        List<Product>? products =
            ref.watch(searchProductsProvider(query)) ?? [];
        // List<Vendor>? vendors = ref.watch(searchVendorsProvider(query)) ?? [];
        ref.read(searchHistoryProvider.notifier).searchHistory(query);
        // print("The search query is => ${ref.watch(searchQueryProvider)}");
        print("This is the results of searching functions => ${[
          ...products,
          // ...vendors
        ]}");

        if (query.isEmpty) {
          showSuggestions(context);
        }

        return products.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // if (vendors!.isNotEmpty)
                  //   Flexible(
                  //     flex: 1,
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 5.w),
                  //       child: ListView.builder(
                  //           scrollDirection: Axis.horizontal,
                  //           itemCount: vendors.length,
                  //           itemBuilder: (context, index) {
                  //             print("This list search length is => ${[
                  //               ...products,
                  //               ...?vendors
                  //             ].length}");
                  //             return GestureDetector(
                  //               onTap: () {
                  //                 Navigator.of(context).push(MaterialPageRoute(
                  //                     builder: (context) => VendorScreen(
                  //                         vendor: vendors[index])));
                  //               },
                  //               child: Container(
                  //                 margin:
                  //                     EdgeInsets.symmetric(horizontal: 10.w),
                  //                 // height: 120.h,
                  //                 width: 80.w,
                  //                 // color: Colors.green,
                  //                 child: Card(
                  //                   child: Column(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.center,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.center,
                  //                     children: [
                  //                       Flexible(
                  //                           child: Image.network(
                  //                               vendors[index].vendorShopLogo)),
                  //                       Flexible(
                  //                           child: AutoSizeText(
                  //                         vendors[index].vendorShopName,
                  //                         textAlign: TextAlign.center,
                  //                       ))
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             );
                  //           }),
                  //     ),
                  //   ),
                  // if (vendors.isNotEmpty) Divider(),
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
                              leading: Image.network(products[index].thumbnailImages[0]),
                              title: Row(
                                children: [
                                  Text(products[index].title),
                                  Spacer(),
                                  Text(
                                      products[index].price.toString() + " OMR")
                                ],
                              ),
                              // subtitle: Text(products[index].price.toString()),
                              subtitle: Text(products[index].shortDescription),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsScreen2(
                                        product: products[index])));
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
                  if (query.isNotEmpty && products.isEmpty)
                    Center(child: Text("No Results Found For This Search...")),
                  if (query.isEmpty)
                    Center(
                        child: Text(
                            "Search for your shop name or your product...")),
                ],
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {



    return Consumer(
      builder: (context, ref, child) {
        List<String> searchHistory = ref.watch(searchHistoryProvider).where((searchResult){
          final result = searchResult.toLowerCase();
          final input = query.toLowerCase();

          return result.contains(input);
        }).toList();
        

        return searchHistory.isEmpty
            ? GestureDetector(
                onTap: () {
                  if (query.isEmpty) {
                    close(context, null);
                  } else {
                    showResults(context);
                  }
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(
                      child: Text("Search for your shop name or your product...")),
                ),
              )
            : GestureDetector(
                onTap: () {
                  if (query.isEmpty) {
                    close(context, null);
                  } else {
                    showResults(context);
                  }
                },
                child: ListView.separated(
                  itemCount: searchHistory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchHistory[index]),
                      onTap: () {
                        query = searchHistory[index];
                        showResults(context);
                      },
                    );
                  }, separatorBuilder: (BuildContext context, int index) { return Divider(); },
                ),
              );
      },
    );
  }


}
