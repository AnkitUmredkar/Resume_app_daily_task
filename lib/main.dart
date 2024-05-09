import 'package:flutter/material.dart';
import 'package:resume_app_daily_task/util/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(statusBarColor: Colors.green),
    // );
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    // ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
