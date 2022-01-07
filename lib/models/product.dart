

import 'package:flutter/material.dart';


class Product{
  final String title;
  final double price;
  final String img;
  bool isFavorited;
  final List<Color> productColors;

  Product( {required this.title, required this.price, required this.img, this.isFavorited = false, required this.productColors,});
}

List<Product> products = [
  Product(title: "Nancy Chair", price: 29.00, img: "assets/images/new_arrivals/1st_product.png", isFavorited: true, productColors: []),
  Product(title: "Table Wood Pine", price: 29.00, img: "assets/images/new_arrivals/2nd_product.png", productColors: []),
  Product(title: "Daisy Table", price: 29.00, img: "assets/images/new_arrivals/3rd_product.png", productColors: []),
];

List<Product> bestSellersProducts = [
  Product(title: "Houndstooth Side Zipper", price: 29.00, img: "assets/images/best_sellers/best_sellers_item1.png", isFavorited: true, productColors: []),
  Product(title: "Ovora Design Table Teak", price: 29.00, img: "assets/images/best_sellers/best_sellers_item2.png", productColors: []),
  Product(title: "Atelier Fuji NC Chair", price: 29.00, img: "assets/images/best_sellers/best_sellers_item3.png", productColors: []),
];

List<Product> shoppingCartProducts = [
  Product(title: "Houndstooth Side Zipper", price: 29.00, img: "assets/images/cart_items/cart_item_1.jpg", isFavorited: true, productColors: [Colors.black]),
  Product(title: "Ovora Design Table Teak", price: 29.00, img: "assets/images/cart_items/cart_item_2.jpg", productColors: [Colors.white]),
  Product(title: "Atelier Fuji NC Chair", price: 29.00, img: "assets/images/cart_items/cart_item_3.jpg", productColors: [Colors.yellow]),
  Product(title: "Ikea Black Chair", price: 29.00, img: "assets/images/cart_items/cart_item_4.jpg", productColors: [Colors.black]),
];