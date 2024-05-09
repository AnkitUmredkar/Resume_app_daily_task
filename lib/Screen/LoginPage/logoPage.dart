import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_app_daily_task/util/global.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFffe401),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 260,
                  width: 260,
                  margin:
                      EdgeInsets.only(top: height * 0.12, bottom: height * 0.2),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/logo.png'),
                    ),
                  ),
                ),
                const Text(
                  'Build Awesome Apps',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const Text(
                  "Let's put your creativity on the\n       development highway",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'poppins'),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('loginPage');
                          setState(() {
                            buttonColor = Colors.black;
                            textColor = Colors.white;
                          });
                          Timer(const Duration(seconds: 2), () {
                            setState(() {
                              buttonColor = const Color(0xFFffe401);
                              textColor = Colors.black;
                            });
                          });
                        },
                        child: Button('LOGIN', buttonColor, textColor),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            check = !check;
                            if (check) {
                              buttonColor1 = Colors.black;
                              textColor1 = Colors.white;
                            } else {
                              buttonColor1 = const Color(0xFFffe401);
                              textColor1 = Colors.black;
                            }
                          });
                        },
                        child: Button('SIGNUP', buttonColor1, textColor1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container Button(String data, Color c1, Color c2) {
  return Container(
    height: 55,
    width: 150,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: c1,
      border: Border.all(
        color: const Color(0xFF987C00),
        width: 1.5,
      ),
    ),
    child: Text(
      data,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: c2),
    ),
  );
}
