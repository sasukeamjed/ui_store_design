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
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/product_category_model.dart';
import 'package:ui_store_design/models/user_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/services/data/states/data_states.dart';

class VendorsList extends StateNotifier<List<Vendor>?> {
  final baseUrl = "https://4ustore.net/";
  late Dio _dio;

  VendorsList() : super([]) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
      //This is should be the solution for DioError [DioErrorType.response]: Http status error [415]
      // contentType: 'application/x-www-form-urlencoded',
      headers: {"Connection": "Keep-Alive",},
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
    print("data init function is called fetching all vendors and fetching all products ++++++++");
    List<Vendor> vendors = await _fetchAllVendors();
    List<Product> products = await _fetchAllProducts();

    _filteringProducts(vendors, products);
  }

  Future<List<Vendor>> _fetchAllVendors() async {

    late Response response;
    try {
      print("awaiting");
      response = await _dio.get("wp-json/wcfmmp/v1/store-vendors");
      print("Before Listing +++++++++++++++++++++++++++++++++++++");
      List<dynamic> vendors = response.data;
      print(vendors[0]);
      return vendors.map((vendor) => Vendor.fromJson(vendor)).toList();
      print("After Listing +++++++++++++++++++++++++++++++++++++++++++");
      // state = DataLoaded(vendors.map((data) => Product.fromJson(data)).toList());
      print("state is loaded --------------------------------------------");
    } catch (e) {
      print("This is an error from fetchAllVendors function => $e");

    }
    return [];
  }

  void _filteringProducts(List<Vendor> vendors, List<Product> products) {
    List<Vendor> vendorsWithListedProducts = [];

    vendors.forEach((vendor) {
      products.forEach((product) {
        if (vendor.vendorId == int.parse(product.postAuthor)) {
          vendor.vendorProducts.add(product);
        }
      });
      vendorsWithListedProducts.add(vendor);
    });
    state = vendorsWithListedProducts;
  }
  //This function receives list of categories names and return all the products which has name with that category
  List<Product> filterProductsByCategory(List<ProductCategory> categoriesParameter) {
    
    // List<Product> listOfAllProducts = [];

    List<Product> filteredList = [];

    List<Product> vendorsProducts = [];
    state?.forEach((vendor) {
      vendorsProducts.addAll(vendor.vendorProducts);
    });

    //We shuffle the list because we don't want them in a specific range
    vendorsProducts.shuffle();

    categoriesParameter.forEach((outerCategory) {
      vendorsProducts.forEach((product) {
        product.categories.forEach((insideCategory) {
          if(insideCategory.categoryId == outerCategory.categoryId){
              filteredList.add(product);
          }
        });
      });
    });


    //And to remove any product Duplicates we will use set() method which make a list of unique elements


    //ToDo: next we want to shuffle the list by using the shuffle method because we don't want it to be organized
    return filteredList.toSet().toList();
  }

  Future<List<Product>> _fetchAllProducts() async {
    // state = DataInitial();
    late Response response;
    try {
      print("awaiting");
      response = await _dio.get("wp-json/wcfmmp/v1/products", queryParameters: {
        "per_page": "100",
        // "consumer_secret" : "cs_edccfa40d65e6ede5b3ed40126793ef296910c58",
        // "orderby" : "date",
        // "per_page" : 5,
      });
      print("Before Listing +++++++++++++++++++++++++++++++++++++");
      List<dynamic> products = response.data;

      print(products
          .map((product) => Product.fromJson(product))
          .toList()
          .where(
              (product) => product.price != 0.00 && product.status == "publish")
          .toList());
      print("fetching products has finished");
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
  }

  List<Product> sortProductsByDate(){
    List<Product> allVendorsProducts = [];

    state?.forEach((vendor) {
      allVendorsProducts.addAll(vendor.vendorProducts);
    });

    allVendorsProducts.sort((product1, product2){
      return product1.dateCreated!.compareTo(product2.dateCreated!);
    });

    return allVendorsProducts;
  }

  List<Product> sortProductsByTotalSales(){
    List<Product> allVendorsProducts = [];

    state?.forEach((vendor) {
      allVendorsProducts.addAll(vendor.vendorProducts);
    });

    allVendorsProducts.sort((product1, product2){
      return product2.totalSales!.compareTo(product1.totalSales!);
    });

    return allVendorsProducts;
  }
}

final dataProvider = StateNotifierProvider<VendorsList, List<Vendor>?>((ref) => VendorsList());
