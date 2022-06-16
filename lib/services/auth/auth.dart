import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/errors/bad_request_exeption.dart';
import 'package:ui_store_design/errors/conflict_exeption.dart';
import 'package:ui_store_design/errors/deadline_exceeded_exception.dart';
import 'package:ui_store_design/errors/internal_server_error_exception.dart';
import 'package:ui_store_design/errors/no_internet_connection_exception.dart';
import 'package:ui_store_design/errors/not_found_exception.dart';
import 'package:ui_store_design/errors/unauthorized_exception.dart';

enum AuthState {
  unauthenticated,
  authenticated,
  authenticating,
  failed,
}

// StateNotifier is recommended to encapsulate all your business
// logic into a single class and use it from there.
class AuthStateNotifier extends StateNotifier<AuthState> {
  // Initialize with the default state of "unauthenticated".
  final baseUrl = "https://4ustore.net/";
  late Dio _dio;

  AuthStateNotifier() : super(AuthState.unauthenticated){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
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
        onError: (DioError err, ErrorInterceptorHandler handler){
          print("errors in handlers");
          switch (err.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.sendTimeout:
            case DioErrorType.receiveTimeout:
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

  Future<Response> login() async {
    late Response response;
    // if (email.isEmpty || password.isEmpty) {
    //   state = AuthState.failed;
    //   return;
    // }

    response = await _dio.post("wp-json/api/v1/token", data: {
      "username" : "sasukeamjedd",
      "password" : "Am95868408"
    });

    if (response.statusCode == 200) {
      // await APIClient().saveTokens(response);
      // UserDefaultEntity entity = await ref.watch(userDefaultsProvider(param.sgId).future);
      state = AuthState.authenticated;
      return response;
    } else {
      state = AuthState.failed;
      print(response.data);
      // throw Exception(jsonDecode(response.body)['message'] ?? 'Unknown Error');
    }
    return response;
  }
}

// Finally, create a provider that can be consumed in the presentation layer (UI).
final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) => AuthStateNotifier());