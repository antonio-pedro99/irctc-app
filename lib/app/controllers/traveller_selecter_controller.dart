import 'package:flutter/cupertino.dart';

class SelecterTravellerController with ChangeNotifier {
  SelecterTravellerController({this.selected = 0});

  int selected;

  String get text => selected.toString();

  set text(String value) {
    selected = int.parse(value);
  }

  void increment() {
    selected++;
    notifyListeners();
  }

  void decrement() {
    selected--;
    notifyListeners();
  }
}
