import 'package:formz/formz.dart';

class PostalCodeInput extends FormzInput<String, String> {
  PostalCodeInput.pure() : super.pure('');
  PostalCodeInput.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'postal code is required';
    }
    if (value.length < 4) {
      return 'postal code length must be greater than 4 character';
    }

    return null;
  }
}
