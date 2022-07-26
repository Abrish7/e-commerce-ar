part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class FirstnameChanged extends AuthEvent {
  final String firstname;
  const FirstnameChanged({required this.firstname});

  @override
  List<Object> get props => [firstname];
}

class LastnameChanged extends AuthEvent {
  final String lastname;
  const LastnameChanged({required this.lastname});

  @override
  List<Object> get props => [lastname];
}

class EmailChanged extends AuthEvent {
  final String email;
  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class UsernameChanged extends AuthEvent {
  final String username;
  const UsernameChanged({required this.username});

  @override
  List<Object> get props => [username];
}

class PasswordChanged extends AuthEvent {
  final String password;
  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends AuthEvent {
  final String confirmPassword;
  const ConfirmPasswordChanged({required this.confirmPassword});

  @override
  List<Object> get props => [confirmPassword];
}

class AuthScreenChanged extends AuthEvent {
  final bool isAuthScreenChange;
  const AuthScreenChanged({this.isAuthScreenChange = true});

  @override
  List<Object?> get props => [isAuthScreenChange];
}

class FormCleaned extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SignInSubmitted extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class IsAlreadyLoggedIn extends AuthEvent {
  bool isUserLoggedIn;
  IsAlreadyLoggedIn({required this.isUserLoggedIn});
  @override
  List<Object?> get props => [isUserLoggedIn];
}

class SignUpSubmitted extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SignUpError extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class UserLoaded extends AuthEvent {
  final User user;

  UserLoaded({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
