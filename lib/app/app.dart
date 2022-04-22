import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irctc_dbms/app/constants.dart';
import 'package:irctc_dbms/app/views/pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IRCTC',
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
          primarySwatch: getMaterialColor(swatch)),
      home: const HomePage(),
    );
  }
}
