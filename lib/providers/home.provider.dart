import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int index = 0;

  void goToPage(int num) {
    index = num;
    notifyListeners();
  }
}
