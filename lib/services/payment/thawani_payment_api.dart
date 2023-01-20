import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/errors/bad_request_exeption.dart';
import 'package:ui_store_design/errors/conflict_exeption.dart';
import 'package:ui_store_design/errors/deadline_exceeded_exception.dart';
import 'package:ui_store_design/errors/internal_server_error_exception.dart';
import 'package:ui_store_design/errors/no_internet_connection_exception.dart';
import 'package:ui_store_design/errors/not_found_exception.dart';
import 'package:ui_store_design/errors/unauthorized_exception.dart';
import 'package:ui_store_design/models/vendor_model.dart';


// class VendorsList extends StateNotifier<List<Vendor>?> {
class PaymentsAPI{
  final baseUrl = "https://uatcheckout.thawani.om/api/v1";
  late Dio _dio;

  PaymentsAPI(){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
      //This is should be the solution for DioError [DioErrorType.response]: Http status error [415]
      contentType: 'application/json',
      headers: {
        // "Connection": "Keep-Alive",
        // "Content-Type" : "application/json",
        "thawani-api-key" : "rRQ26GcsZzoEhbrP2HZvLYDbn9C9et",
      },
    ));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          print("${request.method} ${request.path}");
          handler.next(request);
        },
        onResponse: (response, handler) async {
          print("from Onresponse");
          handler.next(response);
        },
        onError: (DioError err, ErrorInterceptorHandler handler) {
          print("errors in handlers");
          print("error response status Code => ${err.response?.statusCode}");
          print("error response => ${err.response}");
          switch (err.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.sendTimeout:
            case DioErrorType.receiveTimeout:
              // dataInit();
              throw DeadlineExceededException(err.requestOptions);
            case DioErrorType.response:
              switch (err.response?.statusCode) {
                case 400:
                  throw BadRequestException(err.requestOptions);
                case 401:
                  throw UnauthorizedException(err.requestOptions);
                case 404:
                  throw NotFoundException(err.requestOptions);
                case 409:
                  throw ConflictException(err.requestOptions);
                case 500:
                  throw InternalServerErrorException(err.requestOptions);
              }
              break;
            case DioErrorType.cancel:
              break;
            case DioErrorType.other:

              throw NoInternetConnectionException(err.requestOptions);
          }

          return handler.next(err);
        },
      ),
    );
  }

  generateSessionRequest(Map sessionBody) async{
    print("Generating a payment Session");

    Response responseUrl;

    try {
      // state = AuthLoading();
      print("this is body => $sessionBody");
      responseUrl = await _dio.post("/checkout/session",
        data: sessionBody,
      );


      if(responseUrl.statusCode != 200 || responseUrl.data == null){
        print("Payment Failed");
        // state = AuthError("Login Failed") ;
        return;
      }
      print("This is the successful payment response data : ${responseUrl.data}");

      return responseUrl.data;

      // state = AuthLoaded(UserModel.fromJson(response?.data));
    } catch (e) {
      // state = AuthError(e.toString());
      print("this is the failed payment response with error : $e}");
    }
  }


}




