import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_app_daily_task/Daily_Task/Registration_Form/Registration_Form.dart';
import 'global.dart';

class IdCard extends StatefulWidget {
  const IdCard({super.key});

  @override
  State<IdCard> createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  top: -330,
                  child: Container(
                    height: height * 0.8,
                    width: width,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffB81736),
                          Color(0xff281537),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.145),
                    child: CircleAvatar(
                      radius: width * 0.2,
                      backgroundColor: const Color(0xffd6d9da),
                      backgroundImage:
                          (fileImage != null) ? FileImage(fileImage!) : null,
                      child: Stack(
                        children: [
                          Center(
                            child: (fileImage == null)
                                ? Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: width * 0.3,
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),
            Text('${txtName.text} ${txtLastName.text}',
                style: const TextStyle(
                    color: Color(0xffB81736),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins')),
            SizedBox(height: height * 0.04),
            Expanded(
              child: Container(
                width: width / 1.4,
                child: Column(
                  children: [
                    Details(' Birth Date      :  ', dateController.text),
                    Details(' Gender          :  ', selectedGender),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Hobby            : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins',
                              fontSize: 20),
                        ),
                        Wrap(
                          children: [
                            Text(
                              hobby,
                              style: const TextStyle(
                                  fontFamily: 'poppins', fontSize: 20),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    Details(' Mo. Number  : ', txtMoNumber.text),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Address        ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins',
                              fontSize: 20),
                        ),
                        Container(
                          width: width / 2.7,
                          child: Text(
                            ' : ${txtAddress.text}',
                            style: const TextStyle(
                                fontFamily: 'poppins', fontSize: 20),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Details('Address : ',txtAddress.text),
          ],
        ),
      ),
    );
  }
}

Row Details(String label, var data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontFamily: 'poppins', fontSize: 20),
      ),
      Text(
        data,
        style: const TextStyle(fontFamily: 'poppins', fontSize: 20),
      ),
      Spacer(),
    ],
  );
}

// 0xffB81736
// 0xff281537
