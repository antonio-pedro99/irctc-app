import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:irctc_dbms/app/controllers/login_control.dart';
import 'package:irctc_dbms/app/models/user.dart';
import 'package:irctc_dbms/app/models/user_register.dart';
import 'package:irctc_dbms/app/services/endpoints.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

import '../models/user_login.dart';

class Auth {
  static dynamic res = {};

  static signWithEmailAndPassword(UserLogin login) async {
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
        User logged = User.fromJson(json.decode(value.body));
        print(logged.id);
        ControlLogin.updateLogin("currentUserID", "${logged.id}");
      } else {
        res["msg"] = value.statusCode;
      }
    });
  }

  static registerWithEmailAndPassword(UserRegister newUser) async {
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
      res = json.decode(value.body);
    });
  }
}

  
/* 
  static final Dio _dio = Dio();

  static Future<List<dynamic>> registerWithEmailAndPassword(
      UserRegister userRegister) async {
    try {
      Response response = await _dio.post(authRegister,
          data: userRegister.toJson(),
          options: Options(headers: {"content-type": "application/json"}));
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
} */
 
/* class Authentication {
  final Dio _dio = Dio();

  Future<Response> signWithEmailAndPassword(UserLogin login) async {
    try {
      Response response =
          await _dio.post(authLogin, data: json.encode(login.toJson()));
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<Response> registerWithEmailAndPassword(
      UserRegister userRegister) async {
    try {
      Response response = await _dio.post(authRegister);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<Response> getUserDetails(int id) async {
    try {
      Response response = await _dio.get(authLogin);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
 */