import 'package:flutter/material.dart';
import '../Screen/Home/homeScreen.dart';

class AppRoutes {
  static Map<String, Widget Function (BuildContext)> routes = {
    '/': (context) => const HomeScreen(),
  };
}