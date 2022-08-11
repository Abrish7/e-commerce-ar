part of 'user_cubit.dart';

class UserState extends Equatable {
  final String username;
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String token;
  const UserState(
      {required this.username,
      required this.id,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.token});

  UserState copyWith(
      {String? username,
      String? id,
      String? firstname,
      String? lastname,
      String? email,
      String? token}) {
    return UserState(
        username: username ?? this.username,
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        token: token ?? this.token);
  }

  @override
  List<Object> get props => [username, id, firstname, lastname, email, token];
}
