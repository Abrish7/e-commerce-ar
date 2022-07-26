part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final FirstnameField firstname;
  final LastnameField lastname;
  final EmailInput email;
  final UsernameField username;
  final PasswordField password;
  final ConfirmPasswordField confirmPassword;
  final FormzStatus status;
  final bool isAuthScreenChange;
  final bool isConnectionOn;
  final bool isAlreadyLoggedIn;
  final User user;

  const AuthState({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.isAuthScreenChange,
    required this.isConnectionOn,
    required this.isAlreadyLoggedIn,
    required this.user,
    this.status = FormzStatus.pure,
  });

  AuthState copyWith(
      {EmailInput? email,
      FirstnameField? firstname,
      LastnameField? lastname,
      UsernameField? username,
      PasswordField? password,
      ConfirmPasswordField? confirmPassword,
      FormzStatus? status,
      bool? isAuthScreenChange,
      bool? isAlreadyLoggedIn,
      User? user,
      bool? isConnectionOn}) {
    return AuthState(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        status: status ?? this.status,
        isAuthScreenChange: isAuthScreenChange ?? this.isAuthScreenChange,
        isAlreadyLoggedIn: isAlreadyLoggedIn ?? this.isAlreadyLoggedIn,
        user: user ?? this.user,
        isConnectionOn: isConnectionOn ?? this.isConnectionOn);
  }

  @override
  List<Object?> get props => [
        firstname,
        lastname,
        email,
        username,
        password,
        confirmPassword,
        status,
        isAuthScreenChange,
        isAlreadyLoggedIn,
        user,
        isConnectionOn
      ];
}
