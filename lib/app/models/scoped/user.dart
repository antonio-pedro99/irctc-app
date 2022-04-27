import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/models/user.dart';
import 'package:irctc_dbms/app/models/user_login.dart';
import 'package:irctc_dbms/app/models/user_register.dart';
import 'package:irctc_dbms/app/services/auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel extends Model {
  bool isLoading = false;
  User? _currentUser;
  bool? logged = false;

  // Auth auth = Auth();
  //Authentication authenticator = Authentication();

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  Map<String, dynamic> userData = <String, dynamic>{};

  Map<String, dynamic> log = <String, dynamic>{};

  @override
  void addListener(listener) {
    super.addListener(listener);
    loadUser();
  }

  loadUser() {
    if (_currentUser != null) {
      userData = _currentUser!.toJson();
    }
    notifyListeners();
  }

  Future<bool> createUser(UserRegister userregister) async {
    await Auth.registerWithEmailAndPassword(userregister);

    if (Auth.res["sucess"] == 1) {
      return true;
    }
    return false;
  }

  makeLogin(String email, String password) {
    isLoading = true;
    notifyListeners();
    Auth.signWithEmailAndPassword(UserLogin(email: email, password: password));
    _currentUser = Auth.currentUser;
    notifyListeners();
    loadUser();
    isLoading = false;
    logged = true;
    notifyListeners();
    /*  authenticator
        .signWithEmailAndPassword(UserLogin(email: email, password: password))
        .then((value) {
      print(value.data);
    }); */
  }

  saveLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("islogged", logged!);
    notifyListeners();
  }

  makelogout() {
    _currentUser = null;
    logged = false;
    saveLogin();
    notifyListeners();
  }

  isLogged() {
    return logged;
  }
}
