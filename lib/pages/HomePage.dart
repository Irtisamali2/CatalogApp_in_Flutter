import 'package:flutter/material.dart';
import 'package:untitled3/models/items.dart';
import 'package:untitled3/widgets/Homepageitems.dart';
import 'package:untitled3/widgets/appdrawer.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  int day = 10;
  double number = 2.2;
  String course = "Flutter";
  num a = 10.0;

  @override
  Widget build(BuildContext context) {
    final list = List.generate(20, (index) => Models.productList[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Our First App"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return HomePageItems(
                    items: list[index],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
