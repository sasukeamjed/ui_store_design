import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';

import '../services/filtering_system/filter.dart';

final sortByFilterProvider = StateProvider<SortByFilter>((ref) => SortByFilter.popular);

final priceFilterProvider = StateProvider<String?>((ref) => null);

final colorFilterProvider = StateProvider<List<String>?>((ref)=> []);

final filteredProducts = FutureProvider<List<Product>>((ref) async{
  final sortTypeFilter = ref.watch<SortByFilter>(sortByFilterProvider);
  final priceFilter = ref.watch<String?>(priceFilterProvider);
  final colorsFilter = ref.watch<List<String>?>(colorFilterProvider);
  //All functions has to recive products
  //1st check the different conditions of sort by filter only runs API call in first condition only
  //2nd check the different conditions of colors filter
  //3rd check the different conditions of price filters

  Future<List<Product>> sortByFilter({SortByFilter sortBy = SortByFilter.popular, List<String>? colorsNames, String? priceRange,required List<Product> productsRecived, required Dio dio}) async{


    try{



      switch(sortBy){

        case SortByFilter.popular:{

          Response response = await dio.get("wp-json/wc/v2/products", queryParameters: {
            "per_page": "100",
            "orderby" : "popularity",
            "order" : "desc"
          });

          List<dynamic> productsResponse = response.data;


          List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

          return products
              .where(
                  (product) => product.price != 0.00 && product.status == "publish")
              .toList();
        }

        case SortByFilter.popular:{

          Response response = await dio.get("wp-json/wc/v2/products", queryParameters: {
            "per_page": "100",
            "orderby" : "popularity",
            "order" : "desc"
          });

          List<dynamic> productsResponse = response.data;


          List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

          return products
              .where(
                  (product) => product.price != 0.00 && product.status == "publish")
              .toList();
        }

        case SortByFilter.sales:{
          products.sort((product1, product2){
            return product2.totalSales.compareTo(product1.totalSales);
          });
          return products;
        }

        case SortByFilter.newest:{
          products.sort((product1, product2){
            return product1.dateCreated.compareTo(product2.dateCreated);
          });
          return products;
        }

        case SortByFilter.priceLowToHigh:{
          products.sort((product1, product2){
            return product1.price.compareTo(product2.price);
          });
          return products;
        }

        case SortByFilter.priceHighToLow:{
          products.sort((product1, product2){
            return product2.price.compareTo(product1.price);
          });
          return products;
        }

      }


    } catch (e) {
      print(e);

    }
    return [];
  }


  return [];
});

class ShopProductsPageProvider extends StateNotifier<List<Product>>{
  ShopProductsPageProvider(List<Product> state) : super(state);



  void filteredProducts(SortByFilter sortByFilter, List<String>? colorsFilter,  String? priceFilter){
    if(sortByFilter == SortByFilter.popular && colorsFilter == null && priceFilter == null){
      state = state;
    }else if(sortByFilter == SortByFilter.sales && colorsFilter == null && priceFilter == null){

    }
  }
}