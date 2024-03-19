import 'package:flutter/material.dart';

class ScreenIndexProvider extends ChangeNotifier {
  // intial index of the screen
  int _screenIndex = 0;

  // getter method for fetching screen index
  int get fetchCurrentScreenIndex => _screenIndex;

  // function for updating screen Index
  void updateScreenIndex(int index) {
    _screenIndex = index;
    notifyListeners();
  }
}
