import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../util/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 185,
                  width: 185,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/logo.png'),
                    ),
                  ),
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins'),
                ),
                const Text(
                  'Make it work, make it right, make it fast',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins'),
                ),
                const SizedBox(height: 25),
                buildTextField('E-mail', Icons.person_outline_rounded, 1),
                const SizedBox(height: 20),
                buildTextField('Password', Icons.fingerprint, 2),
                const SizedBox(height: 25),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                buildContainer('LOGIN', 1, Colors.black),
                const SizedBox(height: 18),
                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'OR',
                      style: TextStyle(fontFamily: 'poppins', fontSize: 18),
                    )),
                const SizedBox(height: 18),
                buildContainer(
                    'Sign-in with Google', 2, const Color(0xFFF8F8F8)),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Signup',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField buildTextField(String data, IconData icon, int ck) {
    return TextField(
      obscureText: (ck == 2) ? ((checkEye) ? true : false) : false,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          size: 25,
        ),
        suffixIcon: (ck == 2)
            ? IconButton(
                onPressed: () {
                  setState(() {
                    checkEye = !checkEye;
                    if (checkEye) {
                      SuffixIcon = Icons.visibility_off;
                    } else {
                      SuffixIcon = Icons.remove_red_eye;
                    }
                  });
                },
                icon: Icon(SuffixIcon),
              )
            : const Icon(
                Icons.abc,
                color: Color(0xFFF8F8F8),
                size: 28,
              ),
        hintText: data,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 3.5,
          ),
        ),
      ),
    );
  }
}

Container buildContainer(String data, int ck, Color ContainerColor) {
  return Container(
    height: 60,
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: ContainerColor,
      borderRadius: BorderRadius.circular(8),
      border: (ck == 2) ? Border.all(color: Colors.grey, width: 2) : null,
    ),
    child: (ck == 1)
        ? Text(
            data,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 28,
                  width: 28,
                  child: Image.asset('assets/image/g.png')),
              const Text(
                '  Sign-in with Google',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
  );
}
