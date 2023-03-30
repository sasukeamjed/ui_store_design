import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/errors/bad_request_exeption.dart';
import 'package:ui_store_design/errors/conflict_exeption.dart';
import 'package:ui_store_design/errors/deadline_exceeded_exception.dart';
import 'package:ui_store_design/errors/internal_server_error_exception.dart';
import 'package:ui_store_design/errors/no_internet_connection_exception.dart';
import 'package:ui_store_design/errors/not_found_exception.dart';
import 'package:ui_store_design/errors/unauthorized_exception.dart';
import 'package:ui_store_design/models/auth_error_model.dart';
import 'package:ui_store_design/models/category_model.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/product_category_model.dart';
import 'package:ui_store_design/models/product_variation_model.dart';
import 'package:ui_store_design/models/user_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';

class ProductsProvider extends StateNotifier<DataState> {
  final baseUrl = "https://4ustore.net/";
  late Dio _dio;

  ProductsProvider() : super(DataInitial()) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000,
      // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
      // responseType: ResponseType.json,

      queryParameters: {
        "consumer_key": "ck_9e32dcae3003edf2db8ec232c0c958ec735210e9",
        "consumer_secret": "cs_e0d9e53cff19cff292d0fe5706665fc628d4ebfb",
      },
      //This is should be the solution for DioError [DioErrorType.response]: Http status error [415]
      // contentType: 'application/x-www-form-urlencoded',
      headers: {
        "Connection": "Keep-Alive",
      },
    ));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          print("${request.method} ${request.path}");
          handler.next(request);
        },
        onResponse: (response, handler) async {
          print("from Onresponse");
          handler.next(response);
        },
        onError: (DioError err, ErrorInterceptorHandler handler) {
          print("errors in handlers");
          switch (err.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.sendTimeout:
            case DioErrorType.receiveTimeout:
              dataInit();
              throw DeadlineExceededException(err.requestOptions);
            case DioErrorType.response:
              switch (err.response?.statusCode) {
                case 400:
                  throw BadRequestException(err.requestOptions);
                case 401:
                  throw UnauthorizedException(err.requestOptions);
                case 404:
                  throw NotFoundException(err.requestOptions);
                case 409:
                  throw ConflictException(err.requestOptions);
                case 500:
                  throw InternalServerErrorException(err.requestOptions);
              }
              break;
            case DioErrorType.cancel:
              break;
            case DioErrorType.other:
              throw NoInternetConnectionException(err.requestOptions);
          }

          return handler.next(err);
        },
      ),
    );
  }

  Future<void> dataInit() async {
    state = DataLoading();
    print("dataInit function is called fetching all DATAs ++++++++");
    // List<Vendor> vendors = await _fetchAllVendors();
    List<Product> products = await _fetchAllProducts();
    List<CategoryModel> categories = await _fetchAllCategories();

    state = DataLoaded(products, categories);

    // _filteringProducts(vendors, products);
  }

  Future<List<Vendor>> _fetchAllVendors() async {
    late Response response;
    try {
      print("fetching all vendors ++++++");
      response = await _dio.get("wp-json/wcfmmp/v1/store-vendors");
      print("fetching vendors finished +++++++++++++++++++++++++++++++++++++");
      List<dynamic> vendors = response.data;
      // print(vendors[0]);
      return vendors.map((vendor) => Vendor.fromJson(vendor)).toList();
      print("After Listing +++++++++++++++++++++++++++++++++++++++++++");
      // state = DataLoaded(vendors.map((data) => Product.fromJson(data)).toList());
      print("state is loaded --------------------------------------------");
    } catch (e) {
      print("This is an error from fetchAllVendors function => $e");
    }
    return [];
  }

  List<Product> getProductsByCategoryId(int categoryId) {
    List<Product> allProducts = (state as DataLoaded).products;
    return allProducts
        .where((product) =>
            product.categories.any((category) => category.id == categoryId))
        .toList();
  }

  List<Product> getRelatedProductsByCategory(Product product) {
    List<Product> filtteredProducts = [];
    product.categories.forEach((category) {
      List<Product> products = getProductsByCategoryId(category.id);
      filtteredProducts.addAll(products);
    });
    return filtteredProducts
        .where((currentProduct) => currentProduct.id != product.id)
        .toList();
  }

  //This function receives list of categories names and return all the products which has name with that category
  // List<Product> filterProductsByCategory(int categoryId) {
  //
  //   // List<Product> listOfAllProducts = [];
  //
  //   List<Product> filteredList = [];
  //
  //   List<Product> allProducts = (state as DataLoaded).products;
  //
  //   allProducts.where((product){
  //     product.categories
  //   });
  //   // state?.forEach((vendor) {
  //   //   vendorsProducts.addAll(vendor.vendorProducts);
  //   // });
  //
  //   //We shuffle the list because we don't want them in a specific range
  //   // vendorsProducts.shuffle();
  //
  //   categoriesParameter.forEach((outerCategory) {
  //     allProducts.forEach((product) {
  //       product.categories.forEach((insideCategory) {
  //         if(insideCategory.id == outerCategory.id){
  //             filteredList.add(product);
  //         }
  //       });
  //     });
  //   });
  //
  //
  //   //And to remove any product Duplicates we will use set() method which make a list of unique elements
  //
  //
  //   //ToDo: next we want to shuffle the list by using the shuffle method because we don't want it to be organized
  //   return filteredList.toSet().toList();
  // }

  Future<List<Product>> _fetchAllProducts() async {
    late Response response;
    try {
      print("awaiting for products fetching");
      response = await _dio.get("wp-json/wc/v3/products", queryParameters: {
        "per_page": "100",
        // "consumer_secret" : "cs_edccfa40d65e6ede5b3ed40126793ef296910c58",
        // "orderby" : "date",
        // "per_page" : 5,
      });
      print(
          "Trying to fetch all products +++++++++++++++++++++++++++++++++++++");
      List<dynamic> productsResponse = response.data;

      // print(products
      //     .map((product) => Product.fromJson(product))
      //     .toList()
      //     .where(
      //         (product) => product.price != 0.00 && product.status == "publish")
      //     .toList());

      List<Product> products =
          productsResponse.map((data) => Product.fromJson(data)).toList();
      print("fetching products has finished");

      return products
          .where(
              (product) => product.price != 0.00 && product.status == "publish")
          .toList();
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<CategoryModel>> _fetchAllCategories() async {
    late Response response;
    try {
      print("awaiting for products categories fetching");
      response =
          await _dio.get("wp-json/wc/v3/products/categories", queryParameters: {
        "per_page": "100",
        // "consumer_secret" : "cs_edccfa40d65e6ede5b3ed40126793ef296910c58",
        // "orderby" : "date",
        // "per_page" : 5,
      });
      print(
          "Trying to fetch all categories +++++++++++++++++++++++++++++++++++++");
      List<dynamic> categoriesResponse = response.data;

      // print(products
      //     .map((product) => Product.fromJson(product))
      //     .toList()
      //     .where(
      //         (product) => product.price != 0.00 && product.status == "publish")
      //     .toList());

      // state = DataLoaded(products.map((data) => Product.fromJson(data)).toList());
      List<CategoryModel> categories = categoriesResponse
          .map((data) => CategoryModel.fromJson(data))
          .toList();
      print("fetching Categories has finished ++++");

      return categories;
    } catch (e) {
      print(e);
      state = DataError(e.toString());
    }
    return [];
  }

  List<Product> sortProductsByDate() {
    List<Product> allProducts = (state as DataLoaded).products;

    allProducts.sort((product1, product2) {
      return product2.dateCreated!.compareTo(product1.dateCreated!);
    });

    return allProducts.take(5).toList();
  }

  List<Product> sortProductsByTotalSales() {
    List<Product> allProducts = (state as DataLoaded).products;

    allProducts.sort((product1, product2) {
      return product2.totalSales.compareTo(product1.totalSales);
    });

    return allProducts;
  }

  Set<String> getColors() {
    //filter the products to which has product variations only
    final List<Product> products = (state as DataLoaded).products.where((product) => product.productVariations != 0).toList();

    List<String> productsColors = [];


    //we loop in each product and then in each variation and check if the map attributes of each variation has a color in it or not
    products.forEach((product) {
      product.productVariations.forEach(
        (variation) => variation.attributes.forEach(
          (key, value) {
            if(key.contains('color')){
              productsColors.add(value);
            }
          },
        ),
      );
    });

    return productsColors.toSet();


  }


}
