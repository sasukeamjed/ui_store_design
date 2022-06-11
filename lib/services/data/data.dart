import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ui_store_design/models/auth_error_model.dart';
import 'package:ui_store_design/models/product.dart';
import 'package:ui_store_design/models/user_model.dart';

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
        onRequest: (request, handler){
          print("${request.method} ${request.path}");
          handler.next(request);
        },
        onResponse: (response, handler)async{
          print("from Onresponse");
          handler.next(response);
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

  Future<Response> _fetchUser(String id) async{

    late Response response;

    //ToDo: we have to make the user object nullable by adding the ? mark like this => User? user

    try{
      response = await _dio.get("/wp-json/wc/v3/customers/$id?consumer_key=ck_66f5ac06e98a00deed07deb52084af2c8582b1b4&consumer_secret=cs_edccfa40d65e6ede5b3ed40126793ef296910c58");
      return response;


    }catch(e){
      print(e);
    }

    return response;
  }

  Future<Response?> login() async{
    late Response response;

    try{
      response = await _dio.post("wp-json/api/v1/token", data: {
        "username" : "sasukeamjedd",
        "password" : "Am95868408"
      });
      final data = jsonDecode(response.data);

      Map<String, dynamic> parsedJwt = _parseJwt(data["jwt_token"]);
      print(parsedJwt);
      //ToDo: trying to get the time stamp and convert it to normal date format
      // var date = new DateTime.fromMicrosecondsSinceEpoch(parsedJwt['iat']);
      var date = DateTime.fromMillisecondsSinceEpoch(parsedJwt['iat'] * 1000);
      print(date);
      response = await _fetchUser(parsedJwt['sub'].toString());
      print(response.data);
      UserModel userModel = UserModel.fromJson(response.data);
      print('/////////////');
      print(userModel);
    }on DioError catch (e){
      if (e.response != null) {
        print(e.response!.data);
        // print(e.response!.headers);
        print(e.response!.statusCode);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      final error = AuthErrorModel.fromJson(e.response!.data);
      print(error);
      return e.response;
    }

    return response;
  }

  Map<String, dynamic> _parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

}