import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';
import 'package:ui_store_design/services/filtering_system/filter.dart';
import 'data_providers.dart';

final dioProvider = Provider((ref)=> ref.read(productsDataProvider.notifier).dio);

final priceFilterProvider = StateProvider<String?>((ref) => null);

final colorFilterProvider = StateProvider<List<String>>((ref) {
  return [];
});

final sortByFilterProvider = StateProvider<SortByFilter>((ref){
  return SortByFilter.popular;
});

final shopScreenLoadingDataState = StateProvider<bool>((ref) => false);


final productsProvider = StateProvider<List<Product>>((ref){

  return (ref.read(productsDataProvider.notifier).state as DataLoaded).products;
});

final mainFilterMethod = Provider.autoDispose<Future<void>>((ref){

  print("main filter method provider is initiated");

  List<Product> _sortByFilter(List<Product> sortProducts, SortByFilter sortTypeFilter) {


    switch (sortTypeFilter) {
      case SortByFilter.popular:
        {

          return sortProducts;
        }

      case SortByFilter.sales:
        {

          return sortProducts.sorted((product1, product2) {
            return product2.totalSales.compareTo(product1.totalSales);
          });

        }

      case SortByFilter.newest:
        {
          return sortProducts
              .sorted((product1, product2) {
            return product2.dateCreated.compareTo(product1.dateCreated);
          });

        }

      case SortByFilter.priceLowToHigh:
        {
          return sortProducts.sorted((product1, product2) {
            return double.parse(product1.price).compareTo(double.parse(product2.price));
          });

        }

      case SortByFilter.priceHighToLow:
        {
          return sortProducts.sorted((product1, product2) {
            return double.parse(product2.price).compareTo(double.parse(product1.price));
          });

        }
      default:
        return sortProducts;
    }
  }

  //we want a function which check if the keys of following map contains a sepecific keyword, and if it dose we want the value
  String? getValueFromMapWithKeyword(Map<String, dynamic> map, String keyword) {
    for (String key in map.keys) {
      if (key.contains(keyword)) {
        return map[key];
      }
    }
    return null;
  }

  List<Product> _sortByColor({required List<String> colorNames, required List<Product> productsRecived}) {
    if(colorNames.isEmpty){
      return productsRecived;
    }

    return productsRecived.where((product) {
      return product.productVariations.any((productVariation) {
        return colorNames.contains(getValueFromMapWithKeyword(productVariation.attributes, 'color'));
      });
    }).toList();
  }



  List<Product> _sortByPrice(String priceRange, {required List<Product> productsRecived}) {

    switch(priceRange){
      case "0-...":{

        return productsRecived;

      }

      case "0-10":{


        return productsRecived.where((product) {
          double productPrice = double.parse(product.price);
          return productPrice >= 0 && productPrice <= 10;
        }).toList();
      }

      case "10-20":{
        return productsRecived.where((product) {
          double productPrice = double.parse(product.price);
          return productPrice >= 10 && productPrice <= 20;
        }).toList();
      }

      case "20-30":{
        return productsRecived.where((product) {
          double productPrice = double.parse(product.price);
          return productPrice >= 20 && productPrice <= 30;
        }).toList();
      }
      case "30-40":{
        return productsRecived.where((product) {
          double productPrice = double.parse(product.price);
          return productPrice >= 30 && productPrice <= 40;
        }).toList();
      }


      case "40-...":{
        return productsRecived.where((product) {
          double productPrice = double.parse(product.price);
          return productPrice > 40;
        }).toList();
      }

      default:
        return productsRecived;

    }
  }



  Future<void> _mainFilter() async {

    final firstFilter = ref.read(sortByFilterProvider);
    final List<String> secondFilter = ref.read(colorFilterProvider);
    final String thirdFilter = ref.read(priceFilterProvider) ?? "0-...";
    final dio = ref.read(dioProvider);
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
      final List<Product> productsAfterFirstFilter = _sortByFilter(filteredProducts, firstFilter);
      // return _sortByColor(colorNames: secondFilter, productsRecived: productsAfterFirstFilter);
      final List<Product> productsAfterSecondFilter = _sortByColor(colorNames: secondFilter, productsRecived: productsAfterFirstFilter);

      ref.read(productsProvider.notifier).state = _sortByPrice(thirdFilter, productsRecived: productsAfterSecondFilter);
      ref.read(shopScreenLoadingDataState.notifier).state = false;
    } catch (e) {
      print(e);
      // return [];
    }

  }



  return _mainFilter();
});






