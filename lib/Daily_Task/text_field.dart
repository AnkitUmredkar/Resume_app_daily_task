import 'package:flutter/material.dart';

class textfield extends StatefulWidget {
  const textfield({super.key});

  @override
  State<textfield> createState() => _textfieldState();
}

TextEditingController txtEmail = TextEditingController();
TextEditingController txtPassword = TextEditingController();

GlobalKey<FormState> formkey = GlobalKey();

class _textfieldState extends State<textfield> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field Must be Required';
                    }
                  },
                  controller: txtEmail,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field Must be Required';
                    }
                  },
                  controller: txtPassword,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (formkey.currentState!.validate()) {
                        success = 'Login SuccessFull';
                      }
                      email = txtEmail.text;
                      pswrd = txtPassword.text;
                      //todo --------------------> reset both field
                      formkey.currentState!.reset();
                    });
                  },
                  child: const Text('Submit'),
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 22),
                ),
                Text(
                  pswrd,
                  style: const TextStyle(fontSize: 22),
                ),
                Text(
                  success,
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String email = '', pswrd = '', success = '';
