import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ControlLogin {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  ControlLogin();

  static void updateLogin(String key, String value) {
    storage.write(key: key, value: value);
  }
  

  static Future<int> currentUserID() async {
    String? tmp = await storage.read(key: "currentUserID");
    return int.parse(tmp!);
  }
}
