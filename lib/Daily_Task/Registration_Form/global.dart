import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

String birthDate = '',gender = '',selectedGender = '',hobby = '';
bool reading = false,writing = false,sports = false,response = true,checkGender = false;
File? fileImage;
ImagePicker imagePicker = ImagePicker();

SizedBox name(String data,double Width,var inputType,var controllerType) {
  return SizedBox(
    width: Width,
    child: TextFormField(
      textInputAction: TextInputAction.next,
      controller: controllerType,
      validator: errorMsg,
      keyboardType: inputType,
      decoration: InputDecoration(
        enabledBorder: enableBorder(),
        focusedErrorBorder: enableBorder(),
        focusedBorder: focusBorder(),
        errorBorder: enableBorder(),
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

String? errorMsg(value) {
  if (value!.isEmpty) {
    return 'Field Must be Required !';
  }
}

