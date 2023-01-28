import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/providers/data_providers.dart';
import 'package:ui_store_design/secure_storage/secure_and_store_user_data.dart';

class SearchHistoryNotifier extends StateNotifier<List<String>>{
  SearchHistoryNotifier() : super([]);

  Future<void> searchHistory(String query) async{

    if(query.isNotEmpty){

      List<String>? searchHistory = await StoreUserQuerySearch.getSearchHistory() ?? [];
      if(searchHistory.length > 4){
        searchHistory.removeLast();
      }
      searchHistory.insert(0, query);
      StoreUserQuerySearch.setSearchHistory(searchHistory ?? []);
    }

    List<String> searchList = await StoreUserQuerySearch.getSearchHistory() ?? [];


    state = searchList.toSet().toList();
  }

}

final searchQueryProvider = StateProvider.autoDispose<String>((ref) => "");

final searchHistoryProvider = StateNotifierProvider<SearchHistoryNotifier, List<String>>((ref){
  return SearchHistoryNotifier();
});

final searchProductsProvider = StateProvider.autoDispose.family<List<Product>, String>((ref, query){
  final String searchQuery = query.toLowerCase();

  final List<Product>? listOfProducts = ref.watch(productsDataProvider);




  if(searchQuery.isEmpty){
    return [];
  }

  return listOfProducts?.where((product){
    return product.title.toLowerCase().contains(searchQuery) || product.description.toLowerCase().contains(searchQuery) || product.shortDescription.toLowerCase().contains(searchQuery);
  }).toList() ?? [];
});

// final searchVendorsProvider = StateProvider.autoDispose.family<List<Vendor>, String>((ref, query){
//   final String searchQuery = query.toLowerCase();
//
//   final List<Product>? listOfProducts = ref.watch(productsDataProvider);
//
//
//   if(searchQuery.isEmpty){
//     return [];
//   }
//
//   return listOfProducts!.where((product){
//     return product.vendorId.toString().contains(searchQuery) || product.vendorShopName.toLowerCase().contains(searchQuery) || product.vendorDescription.toLowerCase().contains(searchQuery);
//   }).toList() ?? [];
// });

// final vendorsSearchDataProvider = StateProvider.autoDispose<List<Vendor>?>((ref){
//   final String searchQuery = ref.watch(searchQueryProvider).toLowerCase();
//   final List<Vendor>? listOfVendors = ref.watch(productsDataProvider);
//
//
//   if(searchQuery.isEmpty){
//     return <Vendor>[];
//   }
//
//   return listOfVendors?.where((vendor){
//     return vendor.vendorId.toString().contains(searchQuery) || vendor.vendorShopName.toLowerCase().contains(searchQuery) || vendor.vendorDescription.toLowerCase().contains(searchQuery);
//   }).toList();
//
//
// });

// final productsSearchDataProvider = StateProvider.autoDispose<List<Product>>((ref){
//   final String searchQuery = ref.watch(searchQueryProvider).toLowerCase();
//   final List<Vendor>? listOfVendors = ref.watch(productsDataProvider);
//
//   List<Product> allProducts = [];
//
//   listOfVendors?.forEach((vendor) {
//     allProducts.addAll(vendor.vendorProducts);
//   });
//
//   if(searchQuery.isEmpty){
//     return <Product>[];
//   }
//
//   return allProducts.where((product){
//     return product.title.toLowerCase().contains(searchQuery) || product.description.toLowerCase().contains(searchQuery) || product.shortDescription.toLowerCase().contains(searchQuery);
//   }).toList();
//
//
// });