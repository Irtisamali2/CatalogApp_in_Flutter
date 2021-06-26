import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  int day = 10;
  double number = 2.2;
  String course = "Flutter";
  num a = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our First App"),
      ),
      drawer: Drawer(),
      body: Center(
        child: Container(
          child: Text("Welcome to $number $course Crash Course $day"),
        ),
      ),
    );
  }
}
