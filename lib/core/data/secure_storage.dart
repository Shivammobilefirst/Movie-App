import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> secureRead(String key) async {
    return _storage.read(key: key);
  }

  Future<void> secureDelete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> secureWrite({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }
}
