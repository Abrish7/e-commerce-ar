class ProductSubCategory {
  final String id;
  final String category;
  final String subCategory;
  final String createdAt;
  final List product;
  final String updatedAt;

  ProductSubCategory(
      {required this.id,
      required this.category,
      required this.subCategory,
      required this.product,
      required this.createdAt,
      required this.updatedAt});

  factory ProductSubCategory.fromJson(Map<String, dynamic> json) {
    return ProductSubCategory(
        id: json['_id'],
        category: json['category'],
        subCategory: json['subCategory'],
        product: json['products'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
