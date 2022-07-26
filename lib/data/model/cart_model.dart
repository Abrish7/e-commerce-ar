class Cart {
  final int productId;
  final int quantity;
  Cart({required this.productId, required this.quantity});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(productId: json['productId'], quantity: json['quantity']);
  }
}
