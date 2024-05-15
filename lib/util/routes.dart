import 'package:flutter/material.dart';
import '../Daily_Task/drawer.dart';
import '../Daily_Task/image_picker.dart';
import '../Daily_Task/snack_bar.dart';
import '../Daily_Task/text_field.dart';
import '../Screen/Google_Login_Page/googleLoginPage.dart';
import '../Screen/Google_Login_Page/loginSuccessful.dart';
import '../Screen/Google_Login_Page/passwordPage.dart';
import '../Screen/LoginPage/loginPage.dart';
import '../Screen/LoginPage/logoPage.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    //TODO Drawer
    // '/': (context) => const DrawerExample(),

    //TODO Login Page UI
    // '/': (context) => const LogoPage(),
    // 'loginPage': (context) => const LoginPage(),

    //TODO GoogleLoginPage
    // '/': (context) => const GoogleLoginPage(),
    // '/PasswordPage': (context) => const PassWordPage(),
    // '/LoginSuccess': (context) => const LoginSuccessful(),

    //TODO Snack Bar
    // '/': (context) => const snackBar(),
    // '/': (context) => textfield(),

    //TODO Image Picker
    '/': (context) => const imagePicker(),
  };
}
