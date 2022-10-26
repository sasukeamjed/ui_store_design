import 'dart:convert';

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

class StoreUserQuerySearch{
  static final _storage = FlutterSecureStorage();

  static const _key = 'search_history';

  static Future setSearchHistory(List<String> searchHistory) async{
    final String searchHistoryAsString = json.encode(searchHistory);
    return await _storage.write(key: _key, value: searchHistoryAsString);
  }

  static Future<List<String>?> getSearchHistory() async{
    final String? searchHistoryAsString = await _storage.read(key: _key);
    return  searchHistoryAsString == null ? null : List<String>.from(json.decode(searchHistoryAsString));
  }
}