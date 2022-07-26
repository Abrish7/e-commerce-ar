import 'package:formz/formz.dart';

class ConfirmPasswordField extends FormzInput<String, String> {
  ConfirmPasswordField.pure() : super.pure('');
  ConfirmPasswordField.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'Confirmation password is required';
    }

    return null;
  }
}
