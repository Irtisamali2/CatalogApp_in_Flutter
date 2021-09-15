import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/pages/HomePage.dart';
import 'package:untitled3/pages/LoginPage.dart';
import 'package:untitled3/routes/myroutes.dart';
import 'package:untitled3/widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Mytheme.theme,
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
