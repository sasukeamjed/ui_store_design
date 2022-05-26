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

    // _dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onError: (error, _){
    //       print(error.message);
    //     },
    //     onRequest: (request, handler){
    //       print("${request.method} ${request.path}");
    //       handler.next(request);
    //     },
    //     onResponse: (response, _){
    //       print(response.data);
    //       // print(jsonDecode(response.data));
    //       // final data = jsonDecode(response.data);
    //       // print(response.data[1]);
    //
    //       // data.forEach((element) {
    //       //   print(element);
    //       //   print("for real?---------------------------------------------------");
    //       // });
    //     },
    //   ),
    // );

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

  Future<Response> fetchUser() async{

    late Response response;

    //ToDo: we have to make the user object nullable by adding the ? mark like this => User? user

    try{
      print("awaiting");
      response = await _dio.get("wp-json/wc/v3/customers?consumer_key=ck_66f5ac06e98a00deed07deb52084af2c8582b1b4&consumer_secret=cs_edccfa40d65e6ede5b3ed40126793ef296910c58");
      List<dynamic> data = response.data;
      //ToDo: (check a bug) getting two responses with the same email
      Iterable<dynamic> user = data.where((element) => element["email"] == "92466162@nomail.com");

      print(user);
    }catch(e){
      print(e);
    }

    return response;
  }

}