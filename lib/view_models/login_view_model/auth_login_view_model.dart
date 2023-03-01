import 'package:flutter/material.dart';
import '../../view/customs/navigator.dart';
import '../../view/screens/main_screen/bottom_navigation.dart';

class Auth with ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void authData(GlobalKey<FormState>? keyVal) {
    if (keyVal!.currentState!.validate()) {
      Navigators.moveTo(() => BottomNavigation());
    }
    notifyListeners();
  }
}
