import 'package:ui_store_design/models/product_category_model.dart';
import 'package:ui_store_design/models/product_model.dart';

class Vendor {
  final int vendorId;
  final String vendorShopName;
  final String vendorEmail;
  final String vendorPhone;
  final String vendorAddress;
  final String vendorShopLogo;

  //This is the image url for vendor shop banner
  final String mobileBanner;
  final String vendorDescription;
  late List<Product> vendorProducts;

  Vendor(
      {required this.vendorId,
      required this.vendorShopName,
      required this.vendorEmail,
      required this.vendorPhone,
      required this.vendorAddress,
      required this.vendorShopLogo,
      required this.mobileBanner,
      required this.vendorDescription,
      required this.vendorProducts});

  factory Vendor.fromJson(Map<String, dynamic> storeData) {
    return Vendor(
      vendorId: storeData["vendor_id"],
      vendorShopName: storeData["vendor_shop_name"],
      vendorEmail: storeData["vendor_email"],
      vendorPhone: storeData["vendor_phone"],
      vendorAddress: storeData["vendor_address"],
      vendorShopLogo: storeData["vendor_shop_logo"],
      mobileBanner: storeData["mobile_banner"],
      vendorDescription: storeData["vendor_description"],
      vendorProducts: [],
    );
  }

  List<String> getCategories(){
    List<ProductCategory> categoriesOfAllProducts = [];
    this.vendorProducts.forEach((product) {
      categoriesOfAllProducts.addAll(product.categories);
    });

    return categoriesOfAllProducts.map((category) => category.categoryName).toSet().toList();

  }

  @override
  String toString() {
    return "vendorId: ${this.vendorId}, vendorShopName: ${this.vendorShopName}, vendorEmail: ${this.vendorEmail}, vendorPhone: ${this.vendorPhone}, vendorAddress: ${this.vendorAddress}, vendorDescription: ${this.vendorDescription}";
  }
}
