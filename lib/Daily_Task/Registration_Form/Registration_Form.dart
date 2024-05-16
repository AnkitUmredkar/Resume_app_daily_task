import 'package:flutter/material.dart';
import 'global.dart';

TextEditingController dateController = TextEditingController();

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
        body: Container(
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
                  height: height,
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
                      SizedBox(height: height * 0.022),
                      Row(
                        children: [
                          name(width, 'First Name'),
                          const Spacer(),
                          name(width, 'Last Name'),
                        ],
                      ),
                      SizedBox(height: height * 0.022),
                      TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          enabledBorder: enableBorder(),
                          focusedBorder: focusBorder(),
                          label: const Text('Address',
                              style: TextStyle(fontFamily: 'poppins')),
                          labelStyle: const TextStyle(color: Color(0xffB81736)),
                        ),
                      ),
                      SizedBox(height: height * 0.022),
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
                          const SizedBox(height: 3),
                          TextField(
                            controller: dateController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() async {
                                      DateTime? datePicked =
                                          await showDatePicker(
                                        context: context,
                                        lastDate: DateTime.now(),
                                        firstDate: DateTime(2000),
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
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.175),
                    child: CircleAvatar(
                      radius: width * 0.17,
                      backgroundColor: const Color(0xffd6d9da),
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: width * 0.3,
                            ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ElevatedButton(
// onPressed: () {
// setState(() async {
// DateTime? datePicked = await showDatePicker(
// context: context,
// initialDate: DateTime.now(),
// firstDate: DateTime(2018),
// lastDate: DateTime(2030),
// );
// if (datePicked != null) {
// setState(() {
// date =
// 'Date : ${datePicked.day} - ${datePicked.month} - ${datePicked.year}';
// });
// }
// });
// },
// child: const Text('Date Time'),
// ),
