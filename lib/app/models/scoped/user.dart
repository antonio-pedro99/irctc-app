import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/controllers/login_control.dart';
import 'package:irctc_dbms/app/models/user.dart';
import 'package:irctc_dbms/app/models/user_login.dart';
import 'package:irctc_dbms/app/models/user_register.dart';
import 'package:irctc_dbms/app/services/auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';


class UserModel extends Model {
  bool isLoading = false;
  User? _currentUser;
  static int? logged;

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
    /*   if (_currentUser != null) {
      userData = _currentUser!.toJson();
    } */
    notifyListeners();
  }

  Future<void> _load() async {
    logged = await ControlLogin.currentUserID();
  }

  Future<bool> createUser(UserRegister userregister) async {
    await Auth.registerWithEmailAndPassword(userregister);

    if (Auth.res["sucess"] == 1) {
      return true;
    }
    return false;
  }

  bool makeLogin(String email, String password) {
    isLoading = true;
    notifyListeners();
    Auth.signWithEmailAndPassword(UserLogin(email: email, password: password));

    if (Auth.res["msg"] != 400) {
      _load();
      notifyListeners();
      loadUser();
      return true;
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  saveLogin() async {
    notifyListeners();
  }

  makelogout() {
    _currentUser = null;
    logged = null;
    saveLogin();
    notifyListeners();
  }

  isLogged() {
    return logged != null;
  }
}
