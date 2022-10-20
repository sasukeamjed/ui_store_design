import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/models/product_model.dart';
import 'package:ui_store_design/models/vendor_model.dart';
import 'package:ui_store_design/providers/data_providers.dart';

final searchQueryProvider = StateProvider.autoDispose<String>((ref) => "");

final vendorsSearchDataProvider = StateProvider.autoDispose<List<Vendor>?>((ref){
  final String searchQuery = ref.watch(searchQueryProvider).toLowerCase();
  final List<Vendor>? listOfVendors = ref.watch(dataProvider);


  if(searchQuery.isEmpty){
    return <Vendor>[];
  }

  return listOfVendors?.where((vendor){
    return vendor.vendorId.toString().contains(searchQuery) || vendor.vendorShopName.toLowerCase().contains(searchQuery) || vendor.vendorDescription.toLowerCase().contains(searchQuery);
  }).toList();


});

final productsSearchDataProvider = StateProvider.autoDispose<List<Product>>((ref){
  final String searchQuery = ref.watch(searchQueryProvider).toLowerCase();
  final List<Vendor>? listOfVendors = ref.watch(dataProvider);

  List<Product> allProducts = [];

  listOfVendors?.forEach((vendor) {
    allProducts.addAll(vendor.vendorProducts);
  });

  if(searchQuery.isEmpty){
    return <Product>[];
  }

  return allProducts.where((product){
    return product.title.toLowerCase().contains(searchQuery) || product.description.toLowerCase().contains(searchQuery) || product.shortDescription.toLowerCase().contains(searchQuery);
  }).toList();


});