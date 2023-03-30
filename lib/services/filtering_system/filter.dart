import 'package:dio/dio.dart';
import 'package:ui_store_design/models/product_model.dart';

enum SortByFilter{
  popular,
  sales,
  newest,
  priceLowToHigh,
  priceHighToLow
}


class ShopFilter{


  static Future<List<Product>> sortByFilter(SortByFilter sortBy,{required List<Product> products, required Dio dio}) async{


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


  static Future<List<Product>> sortByPrice(String priceRange, {required List<Product> products,required Dio dio}) async{
    switch(priceRange){
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


}