import 'dart:convert';

class Product {
  bool available;
  String? description;
  String name;
  String? pic;
  double price;

  Product({
    required this.available,
    this.description,
    required this.name,
    this.pic,
    required this.price,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        description: json["description"],
        name: json["name"],
        pic: json["pic"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "description": description,
        "name": name,
        "pic": pic,
        "price": price,
      };
}
