// To parse this JSON data, do
//
//     final ProductModel = ProductModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String name;
  String url;
  double price;
  bool favorite;
  String title;
  String subtitle;
  int batery;
  int color;

  ProductModel({
    required this.name,
    required this.url,
    required this.price,
    required this.favorite,
    required this.title,
    required this.subtitle,
    required this.batery,
    required this.color,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => new ProductModel(
        name: json["name"],
        url: json["url"],
        price: json["price"],
        favorite: json["favorite"],
        title: json["title"],
        subtitle: json["subtitle"],
        batery: json["batery"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "price": price,
        "favorite": favorite,
        "title": title,
        "subtitle": subtitle,
        "batery": batery,
        "color": color,
      };
}
