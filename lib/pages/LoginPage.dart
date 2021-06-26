import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Text(
        "LoginPage",
        style: TextStyle(
          color: Colors.purple,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
