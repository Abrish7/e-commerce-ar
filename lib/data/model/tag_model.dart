class TagModel {
  String tagName;
  TagModel({required this.tagName});
  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(tagName: json['name']);
  }
}
