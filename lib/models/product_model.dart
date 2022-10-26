import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui_store_design/models/attributes_model.dart';
import 'package:ui_store_design/models/dimensions_model.dart';
import 'package:ui_store_design/models/product_category_model.dart';
import 'package:ui_store_design/models/product_variation_model.dart';
import 'package:ui_store_design/extensions.dart';


class Product{
  Product({
    required this.postAuthor,
    required this.dateCreated,
    required this.status,
    required this.featured,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.id,
    required this.title,
    required this.price,
    required this.totalSales,
    required this.thumbnailImages,
    required this.singleImages,
    required this.categories,
    required this.dimensions,
    required this.attributesModel,
    required this.productVariations,
    this.isFavorited = false,
    required this.productColors,
  });
  //ToDo: we need to add filter for fetching products, we should not fetch products wich has not price and no publish status
  final int id;
  final String title;
  final String postAuthor;
  final DateTime? dateCreated;
  final String status;
  final bool featured;
  final String description;
  final String shortDescription;
  final String sku;
  final double price;
  final int totalSales;
  final DimensionsModel dimensions;
  final List<String> thumbnailImages;
  final List<String> singleImages;
  final List<ProductCategory> categories;
  final List<AttributesModel> attributesModel;
  final List<ProductVariationModel> productVariations;
  bool isFavorited;



  // final String shortDescription;
  // final String description;
  final List<Color>? productColors;

  factory Product.fromJson(Map<String, dynamic> data) {

    return Product(
      id: data["id"],
      title: data["name"],
      postAuthor: data["post_author"],
      dateCreated: DateTime.tryParse(data["date_created"]),
      price: double.parse(data["price"] == '' ? "0.00" : data["price"]),
      totalSales: data["total_sales"],
      dimensions: DimensionsModel.fromJson(data["dimensions"]),
      thumbnailImages: (data["images"] as List).map<String>((json) => json["woocommerce_thumbnail"]).toList(),
      singleImages:(data["images"] as List).map<String>((json) => json["woocommerce_single"]).toList(),
      featured: data["featured"],
      status: data["status"],
      description: data["description"].toString().removeHTMLTags(),
      shortDescription: data["short_description"].toString().removeHTMLTags(),
      sku: data["sku"],
      categories: (data["categories"] as List).map<ProductCategory>((json)=> ProductCategory.fromJson(json)).toList(),
      attributesModel: (data["attributes"] as List).map<AttributesModel>((json)=> AttributesModel.fromJson(json)).toList(),
      productVariations: (data["variations"] as List).map<ProductVariationModel>((json)=> ProductVariationModel.fromJson(json)).toList(),
      productColors: null,
    );
  }


  String removeHTMLTags(String text){
    RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
    String parsedString = text.replaceAll(exp, '');

    return parsedString;
  }


  Map<String, List<String>> getOptions(){
    /*
    Note: we need to get the data from the variations only because the attributes gives a false data
    Map example
    {
      "option_name": "List of string of all the options"
    }
    *
    *
    * */

    Map<String, List<String>> newVariation = {};



    this.attributesModel.forEach((attribute) {
      if(this.productVariations.length != 0){
        List<String> variationsList = [];
        this.productVariations.forEach((variation){

          if(variation.attributes.containsKey("attribute_" + attribute.slug)){
            variationsList.add(variation.attributes["attribute_" + attribute.slug]);
          }

        });

        newVariation[attribute.slug] = variationsList.toSet().toList();

      }
    });


    return newVariation;

  }

  @override
  String toString() {
    return "postAuthor: ${this.postAuthor}, dataCreated: ${this.dateCreated}, status: ${this.status}, featured: ${this.featured}, description: ${this.description}, shortDescription: ${this.shortDescription}, sku: ${this.sku}, id: ${this.id.toString()}, title: ${this.title}, price: ${this.price.toString()}, img: ${this.thumbnailImages}, isFavorited: ${this.isFavorited}";
  }

  // @override
  // // TODO: implement props
  // List<Object?> get props => [postAuthor, dateCreated, status, featured, description, shortDescription, sku, id, title, price, images, categories, attributesModel, productVariations];
}

// List<Product> products = [
//   Product(
//       id: 111,
//       title: "Nancy Chair",
//       price: 29.00,
//       img: "assets/images/new_arrivals/1st_product.png",
//       isFavorited: true,
//       productColors: []),
//   Product(
//       id: 111,
//       title: "Table Wood Pine",
//       price: 29.00,
//       img: "assets/images/new_arrivals/2nd_product.png",
//       productColors: []),
//   Product(
//       id: 111,
//       title: "Daisy Table",
//       price: 29.00,
//       img: "assets/images/new_arrivals/3rd_product.png",
//       productColors: []),
// ];
//
// List<Product> bestSellersProducts = [
//   Product(
//       id: 111,
//       title: "Houndstooth Side Zipper",
//       price: 29.00,
//       img: "assets/images/best_sellers/best_sellers_item1.png",
//       isFavorited: true,
//       productColors: []),
//   Product(
//       id: 111,
//       title: "Ovora Design Table Teak",
//       price: 29.00,
//       img: "assets/images/best_sellers/best_sellers_item2.png",
//       productColors: []),
//   Product(
//       id: 111,
//       title: "Atelier Fuji NC Chair",
//       price: 29.00,
//       img: "assets/images/best_sellers/best_sellers_item3.png",
//       productColors: []),
// ];
//
// List<Product> shoppingCartProducts = [
//   Product(
//       id: 111,
//       title: "Houndstooth Side Zipper",
//       price: 29.00,
//       img: "assets/images/cart_items/cart_item_1.jpg",
//       isFavorited: true,
//       productColors: [Colors.black]),
//   Product(
//       id: 111,
//       title: "Ovora Design Table Teak",
//       price: 29.00,
//       img: "assets/images/cart_items/cart_item_2.jpg",
//       productColors: [Colors.white]),
//   Product(
//       id: 111,
//       title: "Atelier Fuji NC Chair",
//       price: 29.00,
//       img: "assets/images/cart_items/cart_item_3.jpg",
//       productColors: [Colors.yellow]),
//   Product(
//       id: 111,
//       title: "Ikea Black Chair",
//       price: 29.00,
//       img: "assets/images/cart_items/cart_item_4.jpg",
//       productColors: [Colors.black]),
// ];
