import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';
import 'package:ui_store_design/services/filtering_system/filter.dart';
import 'data_providers.dart';

final dioProvider = Provider((ref)=> ref.read(productsDataProvider.notifier).dio);

final priceFilterProvider = StateProvider<String?>((ref) => null);

final colorFilterProvider = StateProvider<List<String>>((ref) => []);

final sortByFilterProvider = StateProvider<SortByFilter>((ref) => SortByFilter.popular);

final shopScreenLoadingDataState = StateProvider<bool>((ref) => false);


final productsProvider = StateProvider<List<Product>>((ref){

  return (ref.read(productsDataProvider.notifier).state as DataLoaded).products;
});

final mainFilterMethod = Provider.autoDispose<Future<List<Product>?>>((ref){

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
    print("color names => $colorNames");
    print("products length => ${productsRecived.length}");
    if(colorNames.isEmpty){
      return productsRecived;
    }

    return productsRecived.where((product) {
      print("this is product variation => ${product.productVariations}");
      return product.productVariations.any((productVariation) {
        print("this product dose onctains the following color => ${getValueFromMapWithKeyword(productVariation.attributes, 'color')}");
        return colorNames.contains(getValueFromMapWithKeyword(productVariation.attributes, 'color'));
      });
    }).toList();
  }


  Future<List<Product>?> _mainFilter() async {

    final firstFilter = ref.read(sortByFilterProvider);
    final List<String> secondFilter = ref.read(colorFilterProvider);
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
      _sortByColor(colorNames: secondFilter, productsRecived: productsAfterFirstFilter).forEach((element) {
        print(element.name);
      });
      return _sortByColor(colorNames: secondFilter, productsRecived: productsAfterFirstFilter);
    } catch (e) {
      print(e);
      return [];
    }

  }



  return _mainFilter();
});




