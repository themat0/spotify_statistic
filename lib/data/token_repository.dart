import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

class TokenRepository {
  final _storage = const FlutterSecureStorage();
  final _accessToken = BehaviorSubject<String?>();

  Stream<String?> get tokenStream => _accessToken.stream;

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
    _accessToken.add(token);
  }

  Future<String?> getToken() async {
    final token = await _storage.read(key: 'token');
    _accessToken.add(token);
    return token;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
    _accessToken.add(null);
  }

  void dispose() {
    _accessToken.close();
  }
}
