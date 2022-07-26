import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Product {
  final int id;
  final String name;
  final Color color;
  final String category;
  final List<dynamic> property;
  final String description;
  final String image;
  final double price;

  const Product(
      {required this.id,
      required this.name,
      required this.color,
      required this.category,
      required this.property,
      required this.description,
      required this.image,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        color: Color(
            int.parse(json['color'].substring(1, 7), radix: 16) + 0xFF000000),
        category: json['category'],
        property: json['property'],
        description: json['description'],
        image: json['image'],
        price: json['price']);
  }
}

class Property {
  late String color;
  late String size;
  Property({required this.color, required this.size});
  Property.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    size = json['size'];
  }
  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['color'] = color;
    data['size'] = size;
    return data;
  }
}
