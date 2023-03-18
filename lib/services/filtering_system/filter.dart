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


  static Future<List<Product>> sortBy({required List<Product> products, required SortByFilter sortBy, required Dio dio}) async{


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
            return product2.dateCreated.compareTo(product1.dateCreated);
          });
          return products;
        }

      }


    } catch (e) {
      print(e);

    }
    return [];
  }

}