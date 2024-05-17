import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'global.dart';

TextEditingController dateController = TextEditingController();
TextEditingController txtName = TextEditingController();
TextEditingController txtLastName = TextEditingController();
TextEditingController txtAddress = TextEditingController();
TextEditingController txtMoNumber = TextEditingController();
GlobalKey<FormState> formkey = GlobalKey();

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formkey,
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffB81736),
                  Color(0xff281537),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height * 0.02, left: width * 0.05),
                    child: const Text(
                      'Hello\nRegistration From!',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.255),
                    padding: const EdgeInsets.fromLTRB(15, 90, 15, 0),
                    height: (response)
                        ? height + height * 0.06
                        : height + height * 0.17,
                    width: width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Registration',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          color: const Color(0xffB61736),
                          thickness: 4,
                          endIndent: width * 0.69,
                        ),
                        SizedBox(height: height * 0.021),
                        Row(
                          children: [
                            name('First Name', width / 2.25, TextInputType.name,
                                txtName),
                            const Spacer(),
                            name('Last Name', width / 2.25, TextInputType.name,
                                txtLastName),
                          ],
                        ),
                        SizedBox(height: height * 0.021),
                        //------------------------------>todo Address
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: txtAddress,
                          validator: errorMsg,
                          maxLines: 2,
                          decoration: InputDecoration(
                            enabledBorder: enableBorder(),
                            focusedBorder: focusBorder(),
                            errorBorder: enableBorder(),
                            focusedErrorBorder: enableBorder(),
                            label: const Text('Address',
                                style: TextStyle(fontFamily: 'poppins')),
                            labelStyle:
                                const TextStyle(color: Color(0xffB81736)),
                          ),
                        ),
                        SizedBox(height: height * 0.021),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Birth Date',
                              style: TextStyle(
                                  color: Color(0xffB81736),
                                  fontFamily: 'poppins',
                                  fontSize: 18),
                            ),
                            const SizedBox(height: 3), //todo Birth Date
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              validator: errorMsg,
                              controller: dateController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() async {
                                        DateTime? datePicked =
                                            await showDatePicker(
                                          context: context,
                                          lastDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                        );
                                        if (datePicked != null) {
                                          birthDate =
                                              '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                                          dateController.text = birthDate;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.calendar_month,
                                        color: Color(0xffB81736))),
                                enabledBorder: enableBorder(),
                                focusedBorder: focusBorder(),
                                errorBorder: enableBorder(),
                                focusedErrorBorder: enableBorder(),
                                label: const Text(
                                  'DD/MM/YYYY',
                                  style: TextStyle(fontFamily: 'poppins'),
                                ),
                                labelStyle:
                                    const TextStyle(color: Color(0xffB81736)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.021),
                        //------------------------------------>todo Phone Number
                        name('Phone Number', width, TextInputType.number,
                            txtMoNumber),
                        SizedBox(height: height * 0.015),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Gender : ',
                                style: TextStyle(
                                    color: Color(0xffB81736), fontSize: 20),
                              ),
                            ),
                            SizedBox(width: width * 0.11),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildRadioListTile('Male'),
                                buildRadioListTile('Female'),
                                buildRadioListTile('Other'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.015),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Hobbies : ',
                                style: TextStyle(
                                    color: Color(0xffB81736), fontSize: 20),
                              ),
                            ),
                            SizedBox(width: width * 0.087),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: reading,
                                      onChanged: (value) {
                                        setState(() {
                                          reading = value!;
                                          if(reading){
                                            hobby = '$hobby ' + 'Reading\n';
                                          }
                                        });
                                      },
                                      activeColor: const Color(0xff281537),
                                    ),
                                    const Text('Reading',
                                        style: TextStyle(
                                            color: Color(0xffB81736),
                                            fontSize: 18))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: writing,
                                      onChanged: (value) {
                                        setState(() {
                                          writing = value!;
                                          if(writing){
                                            hobby = '$hobby ' + 'Writing\n';
                                          }
                                        });
                                      },
                                      activeColor: const Color(0xff281537),
                                    ),
                                    const Text('Writing',
                                        style: TextStyle(
                                            color: Color(0xffB81736),
                                            fontSize: 18))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: sports,
                                      onChanged: (value) {
                                        setState(() {
                                          sports = value!;
                                          hobby = '$hobby ' + 'Sports\n';
                                        });
                                      },
                                      activeColor: const Color(0xff281537),
                                    ),
                                    const Text('Sports',
                                        style: TextStyle(
                                            color: Color(0xffB81736),
                                            fontSize: 18))
                                  ],
                                ),
                                // Checkbox(value: reading, onChanged: onChanged)
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                response = formkey.currentState!.validate();
                                if (!checkGender) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                          'Gender Selection is Required !'),
                                    ),
                                  );
                                }
                              });
                              if (response && checkGender) {
                                Navigator.of(context).pushNamed('/ID Card');
                              }
                            },
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.7,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xffB81736),
                                    Color(0xff281537),
                                  ],
                                ),
                              ),
                              child: const Text(
                                'Generate ID Card',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      XFile? xFileImage = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {
                        fileImage = File(xFileImage!.path);
                      });
                    },
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.175),
                        child: CircleAvatar(
                          radius: width * 0.17,
                          backgroundColor: const Color(0xffd6d9da),
                          backgroundImage: (fileImage != null)
                              ? FileImage(fileImage!)
                              : null,
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
                              Positioned(
                                bottom: -27,
                                right: 0,
                                child: Container(
                                  height: height * 0.12,
                                  width: width * 0.12,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff281537),
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildRadioListTile(String data) {
    return Row(
      children: [
        Radio(
            value: data,
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value!;
                selectedGender = gender;
                checkGender = true;
              });
            },
            fillColor: MaterialStateProperty.all(const Color(0xff281537))),
        Text(
          data,
          style: const TextStyle(color: Color(0xffB81736), fontSize: 18),
        )
      ],
    );
  }
}
