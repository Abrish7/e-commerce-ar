class CartModel {
  final String id;
  final String name;
  final List<dynamic> property;
  final int quantity;
  final String description;
  final List<dynamic> image;
  final List<dynamic> tag;
  final String price;

  const CartModel(
      {required this.id,
      required this.name,
      required this.property,
      required this.quantity,
      required this.description,
      required this.image,
      required this.tag,
      required this.price});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['productId']['_id'],
        name: json['productId']['name'],
        property: json['productId']['attributes'],
        quantity: json['quantity'],
        description: json['productId']['description'],
        image: json['productId']['images'],
        price: json['productId']['price']['\$numberDecimal'],
        tag: json['productId']['tags']);
  }
}

class Property {
  late String name;
  Property({required this.name});
  Property.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    return data;
  }
}
