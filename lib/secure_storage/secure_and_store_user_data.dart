import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserDataSecureStorage{
  static final _storage = FlutterSecureStorage();

  static const _keyToken = 'token';

  static Future setUserToken(String token) async{
    return await _storage.write(key: _keyToken, value: token);
  }

  static Future<String?> getUserToken() async{
    return await _storage.read(key: _keyToken) ?? "";
  }

  static Future<void> deleteUserToken() async{
    return await _storage.delete(key: _keyToken);
  }
}