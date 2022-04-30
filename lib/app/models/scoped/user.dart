import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/models/user.dart';
import 'package:irctc_dbms/app/models/user_login.dart';
import 'package:irctc_dbms/app/models/user_register.dart';
import 'package:irctc_dbms/app/services/auth.dart';
import 'package:http/http.dart' as http;
import 'package:irctc_dbms/app/services/endpoints.dart';
import 'package:irctc_dbms/app/services/user.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel extends Model {
  bool isLoading = false;
  static String? logged;

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  static Map<String, dynamic> userData = <String, dynamic>{};

  User? current_user;

  @override
  void addListener(listener) {
    super.addListener(listener);
  }

  Future<bool> createUser(UserRegister userregister) async {
    await registerWithEmailAndPassword(userregister);

    return false;
  }

  Future<bool?> makeLogin(String email, String password) async {
    notifyListeners();
    AuthResponse res = await signWithEmailAndPassword(
        UserLogin(email: email, password: password));

    if (!res.hasError && res.hasData) {
      UserDataProvider.getUserDetails((res.data as User).id!).then((value) {
        userData["id"] = (res.data as User).id;

        userData = value.toJson();

        notifyListeners();
        saveLogin(res);
      });
      return true;
    }

    notifyListeners();
    return false;
  }

  saveLogin(AuthResponse auth) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_id", "${(auth.data as User).id!}");
    logged = prefs.get("user_id") as String;
    notifyListeners();
  }

  makelogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    logged = "";
    userData = {};

    prefs.setString("user_id", "");
    notifyListeners();
  }

  isLogged() {
    return logged!.isNotEmpty;
  }

  Future<AuthResponse> signWithEmailAndPassword(UserLogin login) async {
    AuthResponse _response = AuthResponse();
    await http
        .post(Uri.parse(authLogin),
            headers: {
              HttpHeaders.acceptHeader: 'application/json',
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.varyHeader: "Accept",
              HttpHeaders.allowHeader: "POST, OPTION"
            },
            body: json.encode(login.toJson()))
        .then((value) {
      if (value.statusCode == 200) {
        _response.data = User.fromJson(jsonDecode(value.body));
      } else {
        _response.onError = jsonDecode(value.body);
      }
    });
    return _response;
  }

  registerWithEmailAndPassword(UserRegister newUser) async {
    AuthResponse _response = AuthResponse();
    await http
        .post(Uri.parse(authRegister),
            headers: {
              HttpHeaders.acceptHeader: 'application/json',
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.varyHeader: "Accept",
              HttpHeaders.allowHeader: "POST, OPTION"
            },
            body: json.encode(newUser.toJson()))
        .then((value) {
      if (value.statusCode == 200) {
        _response.data = jsonDecode(value.body);
      } else {
        _response.onError = jsonDecode(value.body);
      }
    });
  }
}
