import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Database {
  static const storage = FlutterSecureStorage();

  static Future<void> write({required String key, required String? value}) async {
    await storage.write(key: key, value: value);
  }

  static Future<String?> read({required String key}) async {
    return await storage.read(key: key);
  }
}