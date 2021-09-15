import 'dart:convert';

class MyItems {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  MyItems(this.id, this.name, this.desc, this.price, this.color, this.image);

  MyItems copyWith({
    int? id,
    String? name,
    String? desc,
    int? price,
    String? color,
    String? image,
  }) {
    return MyItems(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory MyItems.fromMap(Map<String, dynamic> map) {
    return MyItems(
      map['id'],
      map['name'],
      map['desc'],
      map['price'],
      map['color'],
      map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MyItems.fromJson(String source) =>
      MyItems.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyItems(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyItems &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}

class Models {
  static List<MyItems> productList = [];
}
