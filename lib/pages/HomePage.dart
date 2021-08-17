import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/models/items.dart';
import 'package:untitled3/widgets/Homepageitems.dart';
import 'package:untitled3/widgets/appdrawer.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    decode();
  }

  decode() async {
    final json = await rootBundle.loadString("assets/files/catalog.json");
    print(json);
    var itemProducts = jsonDecode(json);
    print(itemProducts);
    var products = itemProducts["products"];
    print(products);
    Models.productList =
        List.from(products).map((items) => MyItems.fromMap(items)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                itemCount: Models.productList.length,
                itemBuilder: (context, index) {
                  return HomePageItems(
                    items: Models.productList[index],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
