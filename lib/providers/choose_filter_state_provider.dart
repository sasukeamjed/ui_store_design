import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';

import '../services/filtering_system/filter.dart';

final sortByFilterProvider = StateProvider<SortByFilter>((ref) => SortByFilter.popular);



final priceFilterProvider = StateProvider<String?>((ref) => null);

final colorFilterProvider = StateProvider<List<String>?>((ref) => []);

final mainFilterProvider = StateNotifierProvider<FilterNotifier, List<Product>>((ref){
  final SortByFilter sortByFilter = ref.watch(sortByFilterProvider);
  final DataState productsData = ref.watch(productsDataProvider);

  return FilterNotifier(sortByFilter, productsData as DataLoaded, ref.read(productsDataProvider.notifier).dio);
});

final filteredProductsProvider = FutureProvider<List<Product>>((ref) async {
  List<Product> mainFilteredProducts;
  final sortTypeFilter = ref.watch<SortByFilter>(sortByFilterProvider);
  final priceFilter = ref.watch<String?>(priceFilterProvider);
  final colorsFilter = ref.watch<List<String>?>(colorFilterProvider);
  final productsFeteched = ref.watch(productsDataProvider);
  //All functions has to recive products
  //1st check the different conditions of sort by filter only runs API call in first condition only
  //2nd check the different conditions of colors filter
  //3rd check the different conditions of price filters

  List<Product> sortByFilter(List<Product> sortProducts) {


    switch (sortTypeFilter) {
      case SortByFilter.popular:
        {

          return sortProducts;
        }

      case SortByFilter.sales:
        {
          sortProducts.sort((product1, product2) {
            return product2.totalSales.compareTo(product1.totalSales);
          });
          break;
        }

      case SortByFilter.newest:
        {
          sortProducts
              .sort((product1, product2) {
            return product1.dateCreated.compareTo(product2.dateCreated);
          });
          break;
        }

      case SortByFilter.priceLowToHigh:
        {
          sortProducts
              .sort((product1, product2) {
            return product1.price.compareTo(product2.price);
          });
          break;
        }

      case SortByFilter.priceHighToLow:
        {
          sortProducts
              .sort((product1, product2) {
            return product2.price.compareTo(product1.price);
          });
          break;
        }
    }

    return [];
  }

  Future<List<Product>> mainFilter() async {
    List<Product> filteredProducts =
        (ref.watch(productsDataProvider) as DataLoaded).products;

    try {
      Response response = await ref
          .read(productsDataProvider.notifier)
          .dio
          .get("wp-json/wc/v2/products", queryParameters: {
        "per_page": "100",
        "orderby": "popularity",
        "order": "desc"
      });

      List<dynamic> productsResponse = response.data;

      List<Product> products =
          productsResponse.map((data) => Product.fromJson(data)).toList();

      filteredProducts = products
          .where(
              (product) => product.price != 0.00 && product.status == "publish")
          .toList();
    } catch (e) {
      filteredProducts =
          (ref.watch(productsDataProvider) as DataLoaded).products;
      print(e);
    }

    return sortByFilter(filteredProducts);
  }


 mainFilteredProducts = await mainFilter();


  List<Product> _filterProductsByPriceRange(
      {required List<Product> products,
      required double minPrice,
      required double? maxPrice}) {
    if (maxPrice == null) {
      return products.where((product) {
        double productPrice = double.parse(product.price);
        return productPrice >= minPrice;
      }).toList();
    }
    return products.where((product) {
      double productPrice = double.parse(product.price);
      return productPrice >= minPrice && productPrice <= maxPrice!;
    }).toList();
  }

  Future<List<Product>> sortByPrice(
      {required List<Product> productsRecived}) async {
    switch (priceFilter) {
      case null:
        {
          return productsRecived;
        }

      case "0-10":
        {
          return _filterProductsByPriceRange(
              products: productsRecived, maxPrice: 10, minPrice: 0);
        }

      case "10-20":
        {
          return _filterProductsByPriceRange(
              products: productsRecived, maxPrice: 20, minPrice: 10);
        }

      case "20-30":
        {
          return _filterProductsByPriceRange(
              products: productsRecived, maxPrice: 30, minPrice: 20);
        }
      case "30-40":
        {
          return _filterProductsByPriceRange(
              products: productsRecived, maxPrice: 30, minPrice: 40);
        }

      case "40-...":
        {
          return _filterProductsByPriceRange(
              products: productsRecived, maxPrice: null, minPrice: 40);
        }

      default:
        return productsRecived;
    }
  }

  return [];
});

class FilterNotifier extends StateNotifier<List<Product>> {
  FilterNotifier(this.sortTypeFilter, this._dataLoaded, this._dataLoadedDio) : super(_dataLoaded.products);



  final SortByFilter sortTypeFilter;
  final DataLoaded _dataLoaded;
  final Dio _dataLoadedDio;
  bool isDataLoading = false;

  // final String priceFilter;
  // final List<String> colorsFilter;

  List<Product> _sortByFilter(List<Product> sortProducts) {


    switch (sortTypeFilter) {
      case SortByFilter.popular:
        {

          return sortProducts;
        }

      case SortByFilter.sales:
        {

          sortProducts.sort((product1, product2) {
            return product2.totalSales.compareTo(product1.totalSales);
          });
          break;
        }

      case SortByFilter.newest:
        {
          sortProducts
              .sort((product1, product2) {
            return product1.dateCreated.compareTo(product2.dateCreated);
          });
          break;
        }

      case SortByFilter.priceLowToHigh:
        {
          sortProducts.sort((product1, product2) {
            return double.parse(product1.price).compareTo(double.parse(product2.price));
          });
          break;
        }

      case SortByFilter.priceHighToLow:
        {
          sortProducts.sort((product1, product2) {
            return double.parse(product2.price).compareTo(double.parse(product1.price));
          });
          break;
        }
    }

    return sortProducts;
  }

  //Test method
  void removeFirstItem()async{
    print("removing an item with items length: ${state.length}");
    isDataLoading = true;
    await Future.delayed(Duration(seconds: 3));

    final List<Product> listOfProducts = state;
    listOfProducts.removeAt(0);
    state = listOfProducts;
    isDataLoading = false;

    print("item is removed with items length: ${state.length}");
  }



  void mainFilter() async {
    // List<Product> filteredProducts =
    //     (ref.watch(productsDataProvider) as DataLoaded).products;

    print("main filter provider is running");
    isDataLoading = true;

    // state = AsyncValue.loading();
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
      filteredProducts = _dataLoaded.products;
      print(e);
    }

    state = _sortByFilter(filteredProducts);
    isDataLoading = false;
  }

}



class ShopProductsPageProvider extends StateNotifier<List<Product>> {
  ShopProductsPageProvider(List<Product> state) : super(state);

  void filteredProducts(SortByFilter sortByFilter, List<String>? colorsFilter,
      String? priceFilter) {
    if (sortByFilter == SortByFilter.popular &&
        colorsFilter == null &&
        priceFilter == null) {
      state = state;
    } else if (sortByFilter == SortByFilter.sales &&
        colorsFilter == null &&
        priceFilter == null) {}
  }
}
