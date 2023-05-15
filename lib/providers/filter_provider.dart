import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';
import 'data_providers.dart';

final dioProvider = Provider((ref)=> ref.read(productsDataProvider.notifier).dio);

final shopScreenLoadingDataState = StateProvider<bool>((ref) => false);

final productsProvider = StateProvider<List<Product>>((ref){

  return (ref.read(productsDataProvider.notifier).state as DataLoaded).products;
});

final mainFilterMethod = Provider.autoDispose.family<Future<List<Product>?>, Dio>((ref, dio){

  Future<List<Product>?> _mainFilter(Dio dio) async {

    try {
      List<Product> filteredProducts;
      Response response = await dio.get(Uri.parse("wp-json/wc/v3/products").toString(), queryParameters: {
        "per_page": "100",
        "orderby": "popularity",
        "order": "desc"
      });

      List<dynamic> productsResponse = response.data;

      List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

      filteredProducts = products.where((product) => product.price != 0.00 && product.status == "publish").toList();
      return filteredProducts;
    } catch (e) {
      print(e);
    }



  }

  return _mainFilter(dio);
});




