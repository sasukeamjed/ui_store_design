import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ui_store_design/models/product.dart';

// abstract class Data{
//   List<Product> fetchAllProducts();
//   fetchAllUsers();
// }

class FetchingData{

  final baseUrl = "https://4ustore.net/";
  late Dio _dio;

  FetchingData(){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, _){
          print(error.message);
        },
        onRequest: (request, handler){
          print("${request.method} ${request.path}");
          handler.next(request);
        },
        onResponse: (response, _){
          print(response.data);
          // print(jsonDecode(response.data));
          // List<dynamic> data = jsonDecode(response.data);
          response.data.forEach((element) {
            print(element);
            print("for real?---------------------------------------------------");
          });
        },
      ),
    );

  }


  List<Product> fetchAllProducts() {
    // TODO: implement fetchAllProducts
    throw UnimplementedError();
  }


  Future<Response> fetchAllUsers() async{
    late Response response;

    try{
      print("awaiting");
      response = await _dio.get("wp-json/wc/v3/customers?consumer_key=ck_66f5ac06e98a00deed07deb52084af2c8582b1b4&consumer_secret=cs_edccfa40d65e6ede5b3ed40126793ef296910c58");
      print("finished waiting");
    }catch(e){
      print(e);
    }

    return response;
  }

}