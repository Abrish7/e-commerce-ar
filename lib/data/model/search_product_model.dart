class SearchProductModel {
  final String id;
  final String name;
  final List<dynamic> tag;
  final List<dynamic> images;

  SearchProductModel(
      {required this.id,
      required this.name,
      required this.tag,
      required this.images});

  factory SearchProductModel.fromJson(Map<String, dynamic> json) {
    return SearchProductModel(
        id: json['id'],
        name: json['name'],
        tag: json['tag'],
        images: json['images']);
  }
}
