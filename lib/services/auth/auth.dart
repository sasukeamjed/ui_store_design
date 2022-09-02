import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_store_design/errors/bad_request_exeption.dart';
import 'package:ui_store_design/errors/conflict_exeption.dart';
import 'package:ui_store_design/errors/deadline_exceeded_exception.dart';
import 'package:ui_store_design/errors/internal_server_error_exception.dart';
import 'package:ui_store_design/errors/no_internet_connection_exception.dart';
import 'package:ui_store_design/errors/not_found_exception.dart';
import 'package:ui_store_design/errors/unauthorized_exception.dart';
import 'package:ui_store_design/models/user_model.dart';
import 'package:ui_store_design/services/auth/states/auth_state.dart';

import 'authO_1.0/autho_1.0.dart';

// StateNotifier is recommended to encapsulate all your business
// logic into a single class and use it from there.
class AuthStateNotifier extends StateNotifier<AuthState> {
  // Initialize with the default state of "unauthenticated".
  final baseUrl = "https://4ustore.net/";
  final testUrl = "http://firashi.local/";
  final desktopTestUrl = "http://10.0.2.2:10010/";
  late Dio _dio;

  AuthStateNotifier() : super(AuthInitial()) {
    // String username = 'ck_7fb1734b3d50ba0e55aedd31753d9450e021f8b7';
    // String password = 'cs_c84a554bf9fbcabceeb864c518f9ae34efe97fe1';
    // String basicAuth =
    //     'Basic ' + base64Encode(utf8.encode('$username:$password'));

    _dio = Dio(BaseOptions(
      baseUrl: desktopTestUrl,
      receiveTimeout: 15000,
      // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
      headers: {
        // 'authorization': desktopTestUrl,
        // HttpHeaders.authorizationHeader: basicAuth,
        HttpHeaders.contentTypeHeader: 'application/json',
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
          print("errors in handlers: ${err.response?.statusCode}");
          print("errors message: ${err.message}");
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
              print("No internet Connection Error: ${err.message}");
              throw NoInternetConnectionException(err.requestOptions);
          }

          return handler.next(err);
        },
      ),
    );
  }

  Future<void> login() async {
    print("login method is running");
    late Response response;
    // if (email.isEmpty || password.isEmpty) {
    //   state = AuthState.failed;
    //   return;
    // }

    try {
      state = AuthLoading();
      response = await _dio.post("wp-json/jwt-auth/v1/token",
        data: {"username": "sasukeamjed", "password": "Am95868408"},
      );

      // final data = jsonDecode(response.data);

      Map<String, dynamic> parsedJwt = _parseJwt(response.data["token"]);
      print("this parsed token => $parsedJwt");
      // await APIClient().saveTokens(response);
      // UserDefaultEntity entity = await ref.watch(userDefaultsProvider(param.sgId).future);
      response = await _fetchUser(parsedJwt['data']['user']['id'].toString());
      print("This is the succesful response data : ${response.data}");
      // state = UserModel.fromJson(json);
      state = AuthLoaded(UserModel.fromJson(response.data));
    } catch (e) {
      state = AuthError(e.toString());
      print("this is the failed response with error : $e}");
    }
  }

  Future<void> signUp() async {
    print("SignUp method is running");
    late Response response;
    // if (email.isEmpty || password.isEmpty) {
    //   state = AuthState.failed;
    //   return;
    // }

    String username = 'ck_7fb1734b3d50ba0e55aedd31753d9450e021f8b7';
    String password = 'cs_c84a554bf9fbcabceeb864c518f9ae34efe97fe1';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    try {
      // state = AuthLoading();
      response = await _dio.post(
        'wp-json/wc/v3/customers',
        options: Options(headers: <String, String>{'authorization': basicAuth}),
        data: {
          "email": "sasukeamjed3@gmail.com",
          "first_name": "Amjed",
          "last_name": "Al Anqoodi",
          "username": "sasamjed2",
          "password": "123456789",
          "billing": {
            "first_name": "John",
            "last_name": "Doe",
            "company": "",
            "address_1": "969 Market",
            "address_2": "",
            "city": "San Francisco",
            "state": "CA",
            "postcode": "94103",
            "country": "US",
            "email": "john.doe@example.com",
            "phone": "(555) 555-5555"
          }
        },
      );
      // final data = jsonDecode(response.data);
      //
      // Map<String, dynamic> parsedJwt = _parseJwt(data["jwt_token"]);
      // // await APIClient().saveTokens(response);
      // // UserDefaultEntity entity = await ref.watch(userDefaultsProvider(param.sgId).future);
      // response = await _fetchUser(parsedJwt['sub'].toString());
      print("This is the succesful response data : ${response.data}");
      // state = UserModel.fromJson(json);
      // state = AuthLoaded(UserModel.fromJson(response.data));
    } catch (e) {
      // state = AuthError(e.toString());
      print("this is the failed response with error : $e}");
    }
  }

  Future<Response> _fetchUser(String id) async {
    late Response response;

    //ToDo: we have to make the user object nullable by adding the ? mark like this => User? user

    try {
      response = await _dio.get(
          "/wp-json/wc/v3/customers/$id?consumer_key=ck_88c454b2ecca2c7771ab5cb55b78960373bf34e2&consumer_secret=cs_16028554482085ee4873df46b4b1dcc090c3e448");
      return response;
    } catch (e) {
      print(e);
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

  /// This Generates a valid OAuth 1.0 URL
  ///
  /// if [isHttps] is true we just return the URL with
  /// [consumerKey] and [consumerSecret] as query parameters
  String _getOAuthURL(String requestMethod, String queryUrl) {
    String cKey = 'ck_7fb1734b3d50ba0e55aedd31753d9450e021f8b7';
    String cSecret = 'cs_c84a554bf9fbcabceeb864c518f9ae34efe97fe1';

    String consumerKey = cKey;
    String consumerSecret = cSecret;

    String token = "";
    String url = queryUrl;
    bool containsQueryParams = url.contains("?");

    Random rand = Random();
    List<int> codeUnits = List.generate(10, (index) {
      return rand.nextInt(26) + 97;
    });

    /// Random string uniquely generated to identify each signed request
    String nonce = String.fromCharCodes(codeUnits);

    /// The timestamp allows the Service Provider to only keep nonce values for a limited time
    int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    String parameters = "oauth_consumer_key=" +
        consumerKey +
        "&oauth_nonce=" +
        nonce +
        "&oauth_signature_method=HMAC-SHA1&oauth_timestamp=" +
        timestamp.toString() +
        "&oauth_token=" +
        token +
        "&oauth_version=1.0&";

    if (containsQueryParams == true) {
      parameters = parameters + url.split("?")[1];
    } else {
      parameters = parameters.substring(0, parameters.length - 1);
    }

    Map<dynamic, dynamic> params = QueryString.parse(parameters);
    Map<dynamic, dynamic> treeMap = new SplayTreeMap<dynamic, dynamic>();
    treeMap.addAll(params);

    String parameterString = "";

    for (var key in treeMap.keys) {
      parameterString = parameterString +
          Uri.encodeQueryComponent(key) +
          "=" +
          treeMap[key] +
          "&";
    }

    parameterString = parameterString.substring(0, parameterString.length - 1);

    String method = requestMethod;
    String baseString = method +
        "&" +
        Uri.encodeQueryComponent(
            containsQueryParams == true ? url.split("?")[0] : url) +
        "&" +
        Uri.encodeQueryComponent(parameterString);

    String signingKey = consumerSecret + "&" + token;
    crypto.Hmac hmacSha1 =
    crypto.Hmac(crypto.sha1, utf8.encode(signingKey)); // HMAC-SHA1

    /// The Signature is used by the server to verify the
    /// authenticity of the request and prevent unauthorized access.
    /// Here we use HMAC-SHA1 method.
    crypto.Digest signature = hmacSha1.convert(utf8.encode(baseString));

    String finalSignature = base64Encode(signature.bytes);

    String requestUrl = "";

    if (containsQueryParams == true) {
      requestUrl = url.split("?")[0] +
          "?" +
          parameterString +
          "&oauth_signature=" +
          Uri.encodeQueryComponent(finalSignature);
    } else {
      requestUrl = url +
          "?" +
          parameterString +
          "&oauth_signature=" +
          Uri.encodeQueryComponent(finalSignature);
    }

    return requestUrl;
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

// Finally, create a provider that can be consumed in the presentation layer (UI).
final authProvider = StateNotifierProvider((ref) => AuthStateNotifier());
