import 'package:flutter/material.dart';
import 'package:movie_app/core/data/secure_storage.dart';

class Utils {
  // Check is Dark Theme
  bool checkIsDarkTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// read  secure keys
  Future<String?> getSecureKeysValue({required String key}) async {
    final SecureStorage secureStorage = SecureStorage();
    return await secureStorage.secureRead(key);
  }
}
