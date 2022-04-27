import 'package:flutter/material.dart';
import 'package:irctc_dbms/app/app.dart';
import 'package:irctc_dbms/app/controllers/login_control.dart';
import 'package:irctc_dbms/app/models/scoped/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserModel.logged = await ControlLogin.currentUserID();
  runApp(const MyApp());
}
