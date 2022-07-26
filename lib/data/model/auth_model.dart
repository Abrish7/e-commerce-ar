class AuthModel {
  final String username;
  final String password;
  AuthModel({required this.username, required this.password});
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(username: json['username'], password: json['password']);
  }
}
