import 'dart:collection';
import 'dart:math';
import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;
import 'dart:convert';

/// This Generates a valid OAuth 1.0 URL
///
/// if [isHttps] is true we just return the URL with
/// [consumerKey] and [consumerSecret] as query parameters
String getOAuthURL(String requestMethod, String queryUrl) {

  String consumerKey = "ck_6ec2927822064d4c16919e31dc454ddd756aa0d8";
  String consumerSecret = "cs_74939d4af6f411eefd570a307ef79685ea47e250";

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

  Map parse(String query) {
    var search = new RegExp('([^&=]+)=?([^&]*)');
    var result = new Map();

    // Get rid off the beginning ? in query strings.
    if (query.startsWith('?')) query = query.substring(1);

    // A custom decoder.
    decode(String s) => Uri.decodeComponent(s.replaceAll('+', ' '));

    // Go through all the matches and build the result map.
    for (Match match in search.allMatches(query)) {
      result[decode(match.group(1).toString())] = decode(match.group(2).toString());
    }

    return result;
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
