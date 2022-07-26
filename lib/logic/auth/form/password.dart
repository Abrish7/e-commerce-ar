import 'package:formz/formz.dart';

class PasswordField extends FormzInput<String, String> {
  PasswordField.pure() : super.pure('');
  PasswordField.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'password is required';
    }
    if (value.length < 4) {
      return 'password length must be greater than 4 characters';
    }

    return null;
  }
}
