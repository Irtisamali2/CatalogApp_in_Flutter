// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/src/flutter/sizedbox.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
                child: _load == true
                    ? Container(
                        height: 500,
                        width: 300,
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: FileImage(imageFile))),
                      )
                    : Container(
                        height: 500,
                        width: 300,
                        decoration: BoxDecoration(color: Colors.grey),
                      )),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                          style: ButtonStyle(
                              shape:
                                  MaterialStateProperty.all(StadiumBorder())),
                          onPressed: () {
                            getImage(ImageSource.camera);
                          },
                          child: "Camera".text.bold.xl.make())
                      .py(16)
                      .wh(100, 50),
                  ElevatedButton(
                          style: ButtonStyle(
                              shape:
                                  MaterialStateProperty.all(StadiumBorder())),
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: "Gallery".text.bold.xl.make())
                      .py(16)
                      .wh(100, 50)
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  late File imageFile;
  PickedFile? pickedImage = null;
  bool _load = false;

  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = File(pickedFile!.path);
      _load = true;
    });
    Navigator.pop(context);
  }
}
