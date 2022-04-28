import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlLogin extends ChangeNotifier {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  ControlLogin();
  static void updateLogin(String key, String value) {
    storage.write(key: key, value: value);
  }

  static Future<int> currentUserID() async {
    String? tmp = await storage.read(key: "currentUserID");
    return int.parse(tmp!);
  }

  static userLoggedID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get("user_id");
  }
}
