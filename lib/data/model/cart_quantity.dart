class CartQuantity {
  String quantity;
  CartQuantity({required this.quantity});

  factory CartQuantity.fromJson(Map<String, String> json) {
    return CartQuantity(quantity: json['quantity'].toString());
  }
}
