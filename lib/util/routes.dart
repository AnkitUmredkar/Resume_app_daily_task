import 'package:flutter/material.dart';
import '../Daily_Task/drawer.dart';
import '../Screen/LoginPage/loginPage.dart';
import '../Screen/LoginPage/logoPage.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    //TODO Drawer
    '/': (context) => const DrawerExample(),

    //TODO Login Page UI
    // '/': (context) => const LogoPage(),
    // 'loginPage': (context) => const LoginPage(),
  };
}
