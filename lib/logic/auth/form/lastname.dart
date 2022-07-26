import 'package:formz/formz.dart';

class LastnameField extends FormzInput<String, String> {
  LastnameField.pure() : super.pure('');
  LastnameField.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'Lastname is required';
    }
    if (value.length < 3) {
      return 'Lastname length must be greater than 3 characters';
    }

    return null;
  }
}
