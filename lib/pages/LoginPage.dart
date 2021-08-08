import 'package:flutter/material.dart';
import 'package:untitled3/routes/myroutes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool onChange = false;
  final _formvalidationKey = GlobalKey<FormState>();
  navigateHomePage(BuildContext conext) async {
    if (_formvalidationKey.currentState!.validate()) {
      setState(() {
        onChange = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        onChange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formvalidationKey,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Text("Welcome To Login Screen $name ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter username";
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your Email",
                        labelText: "Email",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter username";
                      } else if (value.length < 7) {
                        return "Please Enter your Password of Atleast 7 alphabets";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Enter your Password",
                        labelText: "Passwprd",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Ink(
                    child: Material(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        splashColor: Colors.yellow,
                        onTap: () {
                          navigateHomePage(context);
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: onChange ? 50 : 100,
                          height: 45,
                          alignment: Alignment.center,
                          child: onChange
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
