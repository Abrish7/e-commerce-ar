class ProductCategory {
  final String name;
  ProductCategory({required this.name});
  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(name: json['name']);
  }
}
