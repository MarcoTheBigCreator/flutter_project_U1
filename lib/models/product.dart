import 'dart:convert';

class ProductScreen {
  String description;
  String pic;

  ProductScreen({
    required this.description,
    required this.pic,
  });

  factory ProductScreen.fromJson(String str) =>
      ProductScreen.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory ProductScreen.fromMap(Map<String, dynamic> json) => ProductScreen(
        description: json["description"],
        pic: json["pic"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "pic": pic,
      };
}
