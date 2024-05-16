import 'package:flutter/material.dart';

String birthDate = '';

SizedBox name(double width, String data) {
  return SizedBox(
    width: width / 2.25,
    child: TextField(
      decoration: InputDecoration(
        enabledBorder: enableBorder(),
        focusedBorder: focusBorder(),
        label: Text(
          data,
          style: const TextStyle(fontFamily: 'poppins'),
        ),
        labelStyle: const TextStyle(color: Color(0xffB81736)),
      ),
    ),
  );
}

OutlineInputBorder focusBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xff8E1E2F),
      width: 2,
    ),
  );
}

OutlineInputBorder enableBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Color(0xff8E1E2F),
    ),
  );
}
