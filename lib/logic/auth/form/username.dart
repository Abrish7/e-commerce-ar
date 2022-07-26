import 'package:formz/formz.dart';

class UsernameField extends FormzInput<String, String> {
  UsernameField.pure() : super.pure('');
  UsernameField.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 3) {
      return 'Username length must be greater than 3 characters';
    }

    return null;
  }
}
