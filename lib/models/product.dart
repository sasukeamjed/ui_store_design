class Product{
  final String title;
  final double price;
  final String img;
  bool isFavorited;

  Product({required this.title, required this.price, required this.img, this.isFavorited = false});
}

List<Product> products = [
  Product(title: "Nancy Chair", price: 29.00, img: "assets/images/new_arrivals/1st_product.png", isFavorited: true,),
  Product(title: "Table Wood Pine", price: 29.00, img: "assets/images/new_arrivals/2nd_product.png"),
  Product(title: "Daisy Table", price: 29.00, img: "assets/images/new_arrivals/3rd_product.png"),
];

List<Product> bestSellersProducts = [
  Product(title: "Houndstooth Side Zipper", price: 29.00, img: "assets/images/best_sellers/best_sellers_item1.png", isFavorited: true,),
  Product(title: "Ovora Design Table Teak", price: 29.00, img: "assets/images/best_sellers/best_sellers_item2.png"),
  Product(title: "Atelier Fuji NC Chair", price: 29.00, img: "assets/images/best_sellers/best_sellers_item3.png"),
];