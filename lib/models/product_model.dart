import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ui_store_design/models/attributes_model.dart';
import 'package:ui_store_design/models/dimensions_model.dart';
import 'package:ui_store_design/models/image_model.dart';
import 'package:ui_store_design/models/product_category_model.dart';
import 'package:ui_store_design/models/product_variation_model.dart';
import 'package:ui_store_design/extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product extends Equatable{
  Product({required this.type, required this.images,
    // required this.postAuthor,
    required this.dateCreated,
    required this.status,
    required this.featured,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.id,
    required this.name,
    required this.price,
    required this.totalSales,
    //ToDo: to get thumbnail image url just add -150x150 at the end before the image extension
    // required this.thumbnailImages,
    //ToDo: to get medium image url just add -300x300 at the end before the image extension
    // required this.singleImages,
    required this.categories,
    required this.dimensions,
    required this.attributes,
    required this.productVariations,
    this.isFavorited = false,
  });
  //ToDo: we need to add filter for fetching products, we should not fetch products wich has not price and no publish status
  final int id;
  final String name;
  // final String postAuthor;
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  final String type;
  final String status;
  final bool featured;
  final String description;
  @JsonKey(name: 'short_description')
  final String shortDescription;
  final String sku;
  final String price;
  @JsonKey(name: 'total_sales')
  final int totalSales;
  final DimensionsModel dimensions;
  // final List<String> thumbnailImages;
  // final List<String> singleImages;
  final List<ImageModel> images;
  final List<ProductCategory> categories;
  final List<AttributesModel> attributes;
  @JsonKey(name: 'product_variations')
  final List<ProductVariationModel> productVariations;
  @JsonKey(ignore: true)
  bool isFavorited;

  factory Product.fromJson(Map<String, dynamic> json)=> _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);



  // final String shortDescription;
  // final String description;


  // factory Product.fromJson(Map<String, dynamic> data) {
  //
  //
  //   ///tried to add toSet() to remove any duplicates
  //   List<String> singleImages = [...(data["images"] as List).map<String>((json) => json["woocommerce_single"]).toList(), ...(data["variations"] as List).map<ProductVariationModel>((json)=> ProductVariationModel.fromJson(json)).toList().map((variation) => variation.singleImage).toList()];
  //   List<String> thumbnailImages = [...(data["images"] as List).map<String>((json) => json["woocommerce_thumbnail"]).toList(), ...(data["variations"] as List).map<ProductVariationModel>((json)=> ProductVariationModel.fromJson(json)).toList().map((variation) => variation.thumbnailImage).toList()];
  //
  //
  //   return Product(
  //     id: data["id"],
  //
  //     name: data["name"],
  //
  //     // postAuthor: data["post_author"],
  //     dateCreated: DateTime.tryParse(data["date_created"]),
  //     price: data["price"],
  //     // price: double.parse(data["price"] == '' ? "0.00" : data["price"]),
  //     totalSales: data["total_sales"],
  //
  //     dimensions: DimensionsModel.fromJson(data["dimensions"]),
  //
  //     // thumbnailImages: thumbnailImages,
  //
  //     // singleImages:singleImages,
  //     featured: data["featured"],
  //
  //     status: data["status"],
  //
  //     description: data["description"].toString(),
  //
  //     shortDescription: data["short_description"].toString().removeHTMLTags(),
  //
  //     sku: data["sku"],
  //
  //     categories: (data["categories"] as List).map<ProductCategory>((json)=> ProductCategory.fromJson(json)).toList(),
  //     attributesModel: (data["attributes"] as List).map<AttributesModel>((json)=> AttributesModel.fromJson(json)).toList(),
  //     productVariations: (data["variations"] as List).map<ProductVariationModel>((json)=> ProductVariationModel.fromJson(json)).toList(),
  //     productColors: null,
  //   );
  // }

  Product productIsChosen(ProductVariationModel productVariation) {


    return Product(
      id: this.id,

      name: this.name,

      // postAuthor: this.postAuthor,
      dateCreated: this.dateCreated,
      price: this.price,
      totalSales: this.totalSales,

      dimensions: this.dimensions,
      images: this.images,
      featured: this.featured,

      status: this.status,

      description: this.description,

      shortDescription: this.shortDescription,

      sku: this.sku,

      categories: this.categories,
      attributes: this.attributes,
      productVariations: [productVariation] ?? [], type: this.type,
    );
  }


  String removeHTMLTags(String text){
    RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
    String parsedString = text.replaceAll(exp, '');

    return parsedString;
  }


  Map<String, List<String>> getOptions(){

    Map<String, List<String>> newVariation = {};



    this.attributes.forEach((attribute) {

      if(this.productVariations.length != 0){

        newVariation[attribute.name.toLowerCase()] = attribute.options;

      }
    });

    // print("get options variations: $newVariation");
    return newVariation;

  }

  @override
  String toString() {
    return "dataCreated: ${this.dateCreated}, status: ${this.status}, featured: ${this.featured}, description: ${this.description}, shortDescription: ${this.shortDescription}, sku: ${this.sku}, id: ${this.id.toString()}, title: ${this.name}, price: ${this.price.toString()}, img: ${this.images}, isFavorited: ${this.isFavorited}, product_variations: ${this.productVariations}";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, dateCreated, status, featured, description, shortDescription, sku, price, totalSales, dimensions, images, categories, attributes, productVariations];

  // @override
  // // TODO: implement props
  // List<Object?> get props => [postAuthor, dateCreated, status, featured, description, shortDescription, sku, id, title, price, images, categories, attributesModel, productVariations];
}



