import 'package:flutter/material.dart';
import '../Screen/LoginPage/loginPage.dart';
import '../Screen/LoginPage/logoPage.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const LogoPage(),
    'loginPage': (context) => const LoginPage(),
  };
}
