class Product {
  final String id;
  final String name;
  // final Color color;
  // final List<String> category;
  final List<dynamic> property;
  final int quantity;
  final String description;
  final List<dynamic> image;
  final List<dynamic> tag;
  final dynamic price;

  const Product(
      {required this.id,
      required this.name,
      // required this.color,
      // required this.category,
      required this.property,
      required this.quantity,
      required this.description,
      required this.image,
      required this.tag,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['_id'],
        name: json['name'],
        // color: json['color'],
        // category: json['category'],
        property: json['attributes'],
        quantity: json['quantity'],
        description: json['description'],
        image: json['images'],
        price: json['price'],
        tag: json['tags']);
  }
}

class Property {
  late String name;
  Property({required this.name});
  Property.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    return data;
  }
}
