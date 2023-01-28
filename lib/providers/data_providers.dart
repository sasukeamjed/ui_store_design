import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/services/data/data.dart';

final productsDataProvider = StateNotifierProvider<ProductsProvider, List<Product>?>((ref) => ProductsProvider());
final productsByVendorNotifier = FutureProvider.family<List<Product>, String>((ref, vendorId) async{
  late Response response;
  try {
    print("awaiting");
    response = await Dio().get("https://4ustore.net/wp-json/wcfmmp/v1/store-vendors/$vendorId/products", queryParameters: {
      "per_page": "100",
      // "consumer_secret" : "cs_edccfa40d65e6ede5b3ed40126793ef296910c58",
      // "orderby" : "date",
      // "per_page" : 5,
    });
    print("Before Listing +++++++++++++++++++++++++++++++++++++");
    List<dynamic> products = response.data;
    print("fetching products has finished 1");
    // print(products
    //     .map((product) => Product.fromJson(product))
    //     .toList()
    //     .where(
    //         (product) => product.price != 0.00 && product.status == "publish")
    //     .toList());
    print("fetching products has finished 2");
    // state = DataLoaded(products.map((data) => Product.fromJson(data)).toList());

    return products
        .map((product) => Product.fromJson(product))
        .toList()
        .where(
            (product) => product.price != 0.00 && product.status == "publish")
        .toList();

  } catch (e) {
    print(e);

  }
  return [];
});


