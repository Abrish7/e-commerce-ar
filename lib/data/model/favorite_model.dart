class Favorite {
  final bool isFav;
  final int productId;

  Favorite({required this.isFav, required this.productId});
  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(isFav: json['isFav'], productId: json['productId']);
  }
}
