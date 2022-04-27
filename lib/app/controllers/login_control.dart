import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ControlLogin {
  static FlutterSecureStorage storage = const FlutterSecureStorage();
  static int userID = 0;

  ControlLogin();

  static void updateLogin(String key, String value) {
    storage.write(key: key, value: value);
  }

  static Future<int> currentUserID() async {
    String? tmp = await storage.read(key: "currentUserID");
    userID = int.parse(tmp!);
    return int.parse(tmp);
  }
}
