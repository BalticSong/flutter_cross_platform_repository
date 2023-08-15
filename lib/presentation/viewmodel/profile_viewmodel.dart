
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  bool _isToggled = false;

  bool get isToggled => _isToggled;

  void toggleSwitch(bool value) {
    _isToggled = value;
    notifyListeners();
  }
}
