import 'package:flutter/material.dart';

class Product {
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
  final String img;
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
      img: data["images"][0]["src"],
      featured: data["featured"],
      status: data["status"],
      description: data["description"],
      shortDescription: data["short_description"],
      sku: data["sku"],
      productColors: null,
    );
  }

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
    required this.img,
    this.isFavorited = false,
    required this.productColors,
  });

  @override
  String toString() {
    return "postAuthor: ${this.postAuthor}, dataCreated: ${this.dateCreated}, status: ${this.status}, featured: ${this.featured}, description: ${this.description}, shortDescription: ${this.shortDescription}, sku: ${this.sku}, id: ${this.id}, title: ${this.title}, price: ${this.price}, img: ${this.img}, isFavorited: ${this.isFavorited}";
  }
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
