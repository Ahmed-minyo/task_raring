import 'package:flutter/material.dart';

class EncryptPassword with ChangeNotifier {
  bool showPass = false;

  void changePassword() {
    showPass = !showPass;
    notifyListeners();
  }
}
