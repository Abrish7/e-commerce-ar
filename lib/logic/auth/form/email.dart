import 'package:formz/formz.dart';

class EmailInput extends FormzInput<String, String> {
  EmailInput.pure() : super.pure('');
  EmailInput.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'email is required';
    }
    if (value.length < 6) {
      return 'email lenght must be greater than 6 character';
    }
    if (!value.contains('@') | !value.contains('.com')) {
      return 'invalid email';
    }

    return null;
  }
}
