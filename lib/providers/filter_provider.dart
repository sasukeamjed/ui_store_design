import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/providers/shop_page_provider/state/shop_page_state.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';
import 'package:ui_store_design/services/filtering_system/filter.dart';
import 'choose_filter_state_provider.dart';
import 'data_providers.dart';

final dioProvider = Provider((ref)=> ref.read(productsDataProvider.notifier).dio);

final shopScreenLoadingDataState = StateProvider<bool>((ref) => false);

final productsProvider = StateProvider<List<Product>>((ref){

  return (ref.read(productsDataProvider.notifier).state as DataLoaded).products;
});

final mainFilterProvider = StateNotifierProvider.family<FilterNotifierUpdated, ShopPageState, List<Product>>((ref, List<Product> products){

  final SortByFilter sortByFilter = ref.watch(sortByFilterProvider);

  // final DataState productsData = ref.read(productsDataProvider);

  return FilterNotifierUpdated(sortByFilter, products, ref.read(productsDataProvider.notifier).dio);
});



class FilterNotifierUpdated extends StateNotifier<ShopPageState> {

  FilterNotifierUpdated(this.sortTypeFilter, this.dataLoaded, this._dataLoadedDio) : super(ShopPageState(productsState: dataLoaded, loadingState: false)){
    _mainFilter();
  }

  final SortByFilter sortTypeFilter;
  final List<Product> dataLoaded;
  final Dio _dataLoadedDio;
  bool isDataLoading = false;

  List<Product> _sortByFilter(List<Product> sortProducts) {


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
            return product1.dateCreated.compareTo(product2.dateCreated);
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


  void _mainFilter() async {


    state = state.copyWith(loadingState: true);
    // print("c:FilterNotifierUpdated l: 83 products state is +++++++");
    state.productsState.forEach((product) {
      print("c:FilterNotifierUpdated l: 91 product is => ${product.name}");
    });
    List<Product> filteredProducts;

    try {
      Response response = await _dataLoadedDio.get(Uri.parse("wp-json/wc/v3/products").toString(), queryParameters: {
        "per_page": "100",
        "orderby": "popularity",
        "order": "desc"
      });

      List<dynamic> productsResponse = response.data;

      List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

      filteredProducts = products.where((product) => product.price != 0.00 && product.status == "publish").toList();

    } catch (e) {
      filteredProducts = this.dataLoaded;
      print(e);
    }

    state = ShopPageState(productsState: _sortByFilter(filteredProducts), loadingState: false);

  }

}

