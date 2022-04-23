import 'package:flutter/cupertino.dart';

class SelecterTravellerController with ChangeNotifier {
  SelecterTravellerController();

  int selected = 0;

  String get text => selected.toString();

  void increment() {
    selected++;
    notifyListeners();
  }

  void decrement() {
    selected--;
    notifyListeners();
  }
}
