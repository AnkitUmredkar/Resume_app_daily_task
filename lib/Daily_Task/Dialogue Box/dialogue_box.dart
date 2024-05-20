import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

ImagePicker imagePicker = ImagePicker();
File? fileImage;
XFile? xFileImage;

class DialogueBox extends StatefulWidget {
  const DialogueBox({super.key});

  @override
  State<DialogueBox> createState() => _DialogueBoxState();
}

class _DialogueBoxState extends State<DialogueBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          toolbarHeight: 70,
          title: const Text(
            'Dynamic TextField',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text(
                              'Alert!',
                              style: TextStyle(fontSize: 15),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            title: const Text(
                              'Hello',
                              style: TextStyle(fontSize: 25),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'ok',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text('Simple DialogueBox'),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: const EdgeInsets.all(15),
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      xFileImage = await imagePicker.pickImage(
                                          source: ImageSource.camera);
                                      setState(() {
                                        fileImage = File(xFileImage!.path);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: options('Gallery', Icons.image),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        xFileImage = await imagePicker.pickImage(
                                            source: ImageSource.gallery);
                                        setState(() {
                                          fileImage = File(xFileImage!.path);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: options('Camera', Icons.camera_alt)),
                                ],
                              ),
                            );
                          });
                    });
                  },
                  child: CircleAvatar(
                    backgroundImage:
                        (fileImage != null) ? FileImage(fileImage!) : null,
                    radius: 70,
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

ListTile options(String data, IconData icon) {
  return ListTile(
    leading: Icon(icon, size: 24),
    title: Text(
      data,
      style: const TextStyle(fontSize: 20),
    ),
  );
}
