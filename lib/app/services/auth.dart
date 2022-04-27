import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:irctc_dbms/app/models/user.dart';
import 'package:irctc_dbms/app/models/user_register.dart';
import 'package:irctc_dbms/app/services/endpoints.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

import '../models/user_login.dart';

class Auth {
  static User? currentUser;

  static signWithEmailAndPassword(UserLogin login) async {
    var response = await http.post(Uri.parse(authLogin),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.varyHeader: "Accept",
          HttpHeaders.allowHeader: "POST, OPTION"
        },
        body: json.encode(login.toJson()));

    if (response.statusCode == 200) {
      currentUser = User.fromJson(json.decode(response.body));
    } else {
      throw Exception(json.decode(response.body));
    }
  }

  User? get getCurrentUser => currentUser;
  static dynamic res = {};
  static Future<void> registerWithEmailAndPassword(UserRegister newUser) async {
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