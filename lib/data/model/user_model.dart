class User {
  final String id;
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String token;
  final String createAt;
  final String updateAt;

  User(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.username,
      required this.email,
      required this.createAt,
      required this.updateAt,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        username: json['username'],
        email: json['email'],
        createAt: json['createAt'],
        updateAt: json['updateAt'],
        token: json['token']);
  }
}
