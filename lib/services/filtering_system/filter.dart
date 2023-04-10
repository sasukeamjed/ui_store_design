import 'package:dio/dio.dart';
import 'package:ui_store_design/models/product_model.dart';

enum SortByFilter{
  //initial means not filter clicked

  popular,
  sales,
  newest,
  priceLowToHigh,
  priceHighToLow
}

List<String> pricesRanges = [
  "0-...",
  "0-10",
  "10-20",
  "20-30",
  "30-40",
  "40-..."
];




class ShopFilter{

  final SortByFilter sortBy;
  final String priceRange;
  final List<Product> products;
  final List<String>? colorsNames;

  ShopFilter({required this.products, this.sortBy = SortByFilter.popular, this.priceRange = "0-...", this.colorsNames});

  Future<List<Product>> sortByFilter({SortByFilter sortBy = SortByFilter.popular, List<String>? colorsNames, String? priceRange,required List<Product> products, required Dio dio}) async{


    try{



      switch(sortBy){

        case SortByFilter.popular:{

          Response response = await dio.get("wp-json/wc/v2/products", queryParameters: {
            "per_page": "100",
            "orderby" : "popularity",
            "order" : "desc"
          });

          List<dynamic> productsResponse = response.data;


          List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

          return products
              .where(
                  (product) => product.price != 0.00 && product.status == "publish")
              .toList();
        }

        case SortByFilter.popular:{

          Response response = await dio.get("wp-json/wc/v2/products", queryParameters: {
            "per_page": "100",
            "orderby" : "popularity",
            "order" : "desc"
          });

          List<dynamic> productsResponse = response.data;


          List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

          return products
              .where(
                  (product) => product.price != 0.00 && product.status == "publish")
              .toList();
        }

        case SortByFilter.sales:{
          products.sort((product1, product2){
            return product2.totalSales.compareTo(product1.totalSales);
          });
          return products;
        }

        case SortByFilter.newest:{
          products.sort((product1, product2){
            return product1.dateCreated.compareTo(product2.dateCreated);
          });
          return products;
        }

        case SortByFilter.priceLowToHigh:{
          products.sort((product1, product2){
            return product1.price.compareTo(product2.price);
          });
          return products;
        }

        case SortByFilter.priceHighToLow:{
          products.sort((product1, product2){
            return product2.price.compareTo(product1.price);
          });
          return products;
        }

      }


    } catch (e) {
      print(e);

    }
    return [];
  }


  Future<List<Product>> sortByPrice(String priceRange, {required Dio dio, required List<Product> productsRecived}) async{

    switch(priceRange){
      case "0-...":{

        return this.products;

      }

      case "0-10":{
        Response response = await dio.get("wp-json/wc/v2/products", queryParameters: {
          "per_page": "100",
          "min_price" : "0",
          "max_price" : "10"
        });

        List<dynamic> productsResponse = response.data;


        List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

        return products
            .where(
                (product) => product.price != 0.00 && product.status == "publish")
            .toList();
      }

      case "10-20":{
        Response response = await dio.get("wp-json/wc/v2/products", queryParameters: {
          "per_page": "100",
          "min_price" : "10",
          "max_price" : "20"
        });

        List<dynamic> productsResponse = response.data;


        List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

        return products
            .where(
                (product) => product.price != 0.00 && product.status == "publish")
            .toList();
      }

      case "20-30":{
        Response response = await dio.get("wp-json/wc/v2/products", queryParameters: {
          "per_page": "100",
          "min_price" : "20",
          "max_price" : "30"
        });

        List<dynamic> productsResponse = response.data;


        List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

        return products
            .where(
                (product) => product.price != 0.00 && product.status == "publish")
            .toList();
      }
      case "30-40":{
        Response response = await dio.get("wp-json/wc/v2/products", queryParameters: {
          "per_page": "100",
          "min_price" : "30",
          "max_price" : "40"
        });

        List<dynamic> productsResponse = response.data;


        List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

        return products
            .where(
                (product) => product.price != 0.00 && product.status == "publish")
            .toList();
      }

      case "30-40":{
        Response response = await dio.get("wp-json/wc/v2/products", queryParameters: {
          "per_page": "100",
          "min_price" : "30",
          "max_price" : "40"
        });

        List<dynamic> productsResponse = response.data;


        List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

        return products
            .where(
                (product) => product.price != 0.00 && product.status == "publish")
            .toList();
      }

      case "40-...":{
        Response response = await dio.get("wp-json/wc/v2/products", queryParameters: {
          "per_page": "100",
          "min_price" : "40",
        });

        List<dynamic> productsResponse = response.data;


        List<Product> products = productsResponse.map((data) => Product.fromJson(data)).toList();

        return products
            .where(
                (product) => product.price != 0.00 && product.status == "publish")
            .toList();
      }

      default:
        return products;

    }
  }

  List<Product> sortByColor({required List<String> colorNames, required List<Product> productsRecived}) {
    return this.products.where((product) {
      return product.productVariations.any((productVariation) {
        return colorNames.contains(productVariation.attributes['color']);
      });
    }).toList();
  }


}