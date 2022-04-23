import 'package:flutter/material.dart';

MaterialColor getMaterialColor(Color color) {
  List strengths = <double>[.05];

  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

const Color greyBackground = Color.fromRGBO(239, 239, 240, 1);
const Color grey = Color.fromRGBO(132, 119, 116, 1);
const Color grey1 = Color.fromRGBO(235, 235, 235, 1);
const Color grey3 = Color.fromRGBO(206, 206, 206, 1);
const Color grey2 = Color.fromRGBO(167, 49, 45, 1);
const Color swatch = Color.fromRGBO(238, 123, 103, 1);
const Color primary = Color.fromRGBO(248, 153, 135, 1);
const Color primary30 = Color.fromRGBO(248, 153, 135, 0.30);
