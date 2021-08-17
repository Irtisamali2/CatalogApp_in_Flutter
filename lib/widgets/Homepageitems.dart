import 'package:flutter/material.dart';

class HomePageItems extends StatelessWidget {
  final items;
  const HomePageItems({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Image.network(items.image),
        title: Text(items.name),
        subtitle: Text(items.desc),
        trailing: Text("\$${items.price}"),
      ),
    );
  }
}
