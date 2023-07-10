import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _storge = FlutterSecureStorage();

class Authorization {
  static Future<void> setToken(String? token) async {
    await _storge.write(key: "token", value: token!);
  }

  static Future<String?> getToken() async {
    String? token = await _storge.read(key: "token");
    return token;
  }
}
