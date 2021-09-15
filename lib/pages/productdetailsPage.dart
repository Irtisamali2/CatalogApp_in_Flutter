import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:untitled3/models/items.dart';

class ProductDetailsPage extends StatelessWidget {
  final MyItems items;
  const ProductDetailsPage({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.deepPurple,
          child: ButtonBar(
            buttonPadding: Vx.m0,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${items.price}".text.bold.xl.make(),
              ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      onPressed: () {},
                      child: "Buy".text.bold.xl.make())
                  .wh(100, 50)
            ],
          ).p16(),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            Hero(
                tag: Key(items.id.toString()),
                child: Image.network(items.image).h40(context).centered()),
            Expanded(
                child: VxArc(
                    height: 40,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      width: context.screenWidth,
                      color: Colors.deepPurple,
                      child: Column(
                        children: [
                          items.name.text.bold.xl5.make(),
                          items.desc.text.xl
                              .color(Colors.black)
                              .caption(context)
                              .make(),
                          10.heightBox,
                        ],
                      ).py64(),
                    )))
          ],
        ));
  }
}
