import 'package:byb/screens/auth/login.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  handleSplash() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      pushAndRemoveUntil(
          navigatorKey.currentState!.context, const LoginScreen());
    });
  }
}
