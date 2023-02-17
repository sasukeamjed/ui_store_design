import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart' as crypto;

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
import 'package:ui_store_design/secure_storage/secure_and_store_user_data.dart';
import 'package:ui_store_design/services/auth/states/auth_state.dart';


import 'authO_1.0/autho_1.0.dart';

// StateNotifier is recommended to encapsulate all your business
// logic into a single class and use it from there.
class AuthStateNotifier extends StateNotifier<AuthState> {
  // Initialize with the default state of "unauthenticated".
  final baseUrl = "https://4ustore.net/";
  final testUrl = "http://firashi.local/";
  final desktopTestUrl = "https://10.0.2.2:10010/";
  final laptopTestUrl = "http://firshibackup.local/";
  late Dio _dio;

  AuthStateNotifier() : super(AuthInitial()) {
    // String username = 'ck_7fb1734b3d50ba0e55aedd31753d9450e021f8b7';
    // String password = 'cs_c84a554bf9fbcabceeb864c518f9ae34efe97fe1';
    // String basicAuth =
    //     'Basic ' + base64Encode(utf8.encode('$username:$password'));

    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000,
      // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
      headers: {
        "Connection": "Keep-Alive",
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
    Response responseUrl;
    // if (email.isEmpty || password.isEmpty) {
    //   state = AuthState.failed;
    //   return;
    // }

    try {
      state = AuthLoading();
      responseUrl = await _dio.post("wp-json/jwt-auth/v1/token",
        data: {"username": "amjad", "password": "@mIJAGaJZ&46vgs@*gRgELr6"},
      );

      // final data = jsonDecode(response.data);


      Map<String, dynamic> parsedJwt = _parseJwt(responseUrl.data["token"]);
      print("this parsed token => $parsedJwt");
      String id = parsedJwt["data"]["user"]["id"];
      Response? response = await _fetchUser(id);
      // await APIClient().saveTokens(response);
      // UserDefaultEntity entity = await ref.watch(userDefaultsProvider(param.sgId).future);
      // response = await _fetchUser(parsedJwt['data']['user']['id'].toString());
      if(response?.statusCode != 200 || response?.data == null){
        print("Login Failed");
        state = AuthError("Login Failed") ;
        return;
      }
      print("This is the succesful response data : ${response?.data}");
      UserDataSecureStorage.setUserToken(responseUrl.data["token"]);
      state = AuthLoaded(UserModel.fromJson(response?.data));
    } catch (e) {
      state = AuthError(e.toString());
      print("this is the failed response with error : $e}");
    }
  }

  Future<Map<String, dynamic>> tokenVerification(String token)async{
    Response response;
    try{
      print("Token data => ${_parseJwt(token)}");
      print("Expiry date is ${DateTime.parse(_parseJwt(token)["exp"].toString())}");
      print("Expiry date is ${DateTime.fromMillisecondsSinceEpoch(_parseJwt(token)["exp"] * 1000)}");
      DateTime dateTimeNow = DateTime.now();
      DateTime tokenExpiryDate = DateTime.fromMillisecondsSinceEpoch(_parseJwt(token)["exp"] * 1000);
      if(dateTimeNow.isAfter(tokenExpiryDate)){
        throw(Exception("Token is expired"));
      }
      response = await _dio
          .post("wp-json/jwt-auth/v1/token/validate",options: Options(headers: <String, String>{'authorization': 'Bearer $token'}));
      //if token is validated and we got 200 response than we want to fetch user by id
      if(response.statusCode == 200){
        Map<String, dynamic> parsedJwt = _parseJwt(token);

        print("this is the id of the fetched user ${parsedJwt['data']['user']['id']}");
        Response? fetchedUser = await _fetchUser(parsedJwt['data']['user']['id']);
        state = AuthLoaded(UserModel.fromJson(fetchedUser?.data));
      }
      print("token is verified");
      return response.data;
    }catch(e){
      print("this error is from the token validation method => $e");
      state = AuthInitial();
      return {
        "code": "jwt_auth_invalid_token",
        "message": e,
        "data": {
          "status": 403
        },
      };
    }

  }

  Future<void> signUp() async {
    print("SignUp method is running");
    late Response response;
    // if (email.isEmpty || password.isEmpty) {
    //   state = AuthState.failed;
    //   return;
    // }

    String username = 'ck_9e32dcae3003edf2db8ec232c0c958ec735210e9';
    String password = 'cs_e0d9e53cff19cff292d0fe5706665fc628d4ebfb';
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

  Future<void> logOut() async{
    state = AuthInitial();
    return UserDataSecureStorage.deleteUserToken();
  }

  Future<Response?> _fetchUser(String id) async {
    Response? response;

    //ToDo: we have to make the user object nullable by adding the ? mark like this => User? user
    String username = 'ck_9e32dcae3003edf2db8ec232c0c958ec735210e9';
    String password = 'cs_e0d9e53cff19cff292d0fe5706665fc628d4ebfb';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    try {
      response = await _dio.get("wp-json/wc/v3/customers/$id", options: Options(headers: <String, String>{'authorization': basicAuth}));

      print("fetch user response => $response");
      return response;
    } catch (e) {
      print("fetchUser error => $e");
      if (e is DioError) {
        if (e.response?.data == null) {
          print("response data is null");
          // return SignInApiResponse(message: Messages.loginFailed);
        }
        print("response data is => ${e.response?.data}");
        // return SignInApiResponse.fromJson(e.response?.data);
      } else {
        print("This is not a DioError => ${e.toString()}");
        // return SignInApiResponse(message: e.toString());
      }
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
    String cKey = 'ck_c68618d20d9e95ac083ffbb4d0f8c9a7112316d1';
    String cSecret = 'cs_256b777addc13d3955e4feb704906981e078903c';

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

    Map<dynamic, dynamic> params = parse(parameters);
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
    crypto.Hmac hmacSha1 = crypto.Hmac(crypto.sha1, utf8.encode(signingKey)); // HMAC-SHA1

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

  Map parse(String query) {
    var search = new RegExp('([^&=]+)=?([^&]*)');
    var result = new Map();

    // Get rid off the beginning ? in query strings.
    if (query.startsWith('?')) query = query.substring(1);

    // A custom decoder.
    decode(String s) => Uri.decodeComponent(s.replaceAll('+', ' '));

    // Go through all the matches and build the result map.
    for (Match match in search.allMatches(query)) {
      result[decode(match.group(1) ?? "null")] = decode(match.group(2) ?? "null");
    }

    return result;
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
