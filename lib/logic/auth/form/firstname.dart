import 'package:formz/formz.dart';

class FirstnameField extends FormzInput<String, String> {
  FirstnameField.pure() : super.pure('');
  FirstnameField.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'Firstname is required';
    }
    if (value.length < 3) {
      return 'Firstname length must be greater than 3 characters';
    }

    return null;
  }
}
