import 'package:flutter/material.dart';

class UiProvider with ChangeNotifier {
  int _selectesMenuOpt = 0;

  int get selectedMenuOpt {
    return this._selectesMenuOpt;
  }

  set selectedMenuOpt(int i) {
    this._selectesMenuOpt = i;
    notifyListeners();
  }
}
