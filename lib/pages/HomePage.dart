import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

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
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShopHeader(),
              if (Models.productList != null && Models.productList.isNotEmpty)
                ProductList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class ShopHeader extends StatelessWidget {
  const ShopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Shop".text.xl5.bold.make(),
        "Featured Products".text.xl3.make()
      ],
    );
  }
}

class ProductList extends StatefulWidget {
  ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Models.productList.length,
        itemBuilder: (context, index) {
          final items = Models.productList[index];
          return Productdetails(
            item: items,
          );
        });
  }
}

class Productdetails extends StatelessWidget {
  final MyItems item;
  const Productdetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Image.network(item.image).box.p12.make().w32(context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            item.name.text.bold.make(),
            item.desc.text.color(Colors.black).caption(context).make(),
            10.heightBox,
            ButtonBar(
              buttonPadding: Vx.m0,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${item.price}".text.make(),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {},
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 10)
          ],
        ).expand()
      ],
    )).square(140).rounded.color(Colors.deepPurple).make().py12();
  }
}
