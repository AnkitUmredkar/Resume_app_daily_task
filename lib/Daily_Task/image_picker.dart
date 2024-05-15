import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

ImagePicker picker = ImagePicker();
File? fileImage, Image;
XFile? xFileImage;

class imagePicker extends StatefulWidget {
  const imagePicker({super.key});

  @override
  State<imagePicker> createState() => _imagePickerState();
}

class _imagePickerState extends State<imagePicker> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF2e14ff),
          elevation: 7,
          shadowColor: Colors.black,
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text(
            'Image Picker',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: height * 0.38,
                  width: width * 0.8,
                  margin: const EdgeInsets.only(bottom: 60),
                  decoration: BoxDecoration(
                    image: (fileImage != null)
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(fileImage!),
                          )
                        : null,
                    color: const Color(0xFF2e14ff),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () async {
                        xFileImage =
                        await picker.pickImage(source: ImageSource.camera);
                        setState(() {
                          if (xFileImage != null) {
                            fileImage = File(xFileImage!.path);
                          }
                        });
                      },
                      icon: const Icon(
                        color: Color(0xFF212121),
                        Icons.camera_alt,
                        size: 60,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        xFileImage =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          if (xFileImage != null) {
                            fileImage = File(xFileImage!.path);
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.image,
                        color: Color(0xFF212121),
                        size: 60,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: width,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 60),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF2e14ff)),
                  child: const Text(
                    'Uploade Me',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
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
