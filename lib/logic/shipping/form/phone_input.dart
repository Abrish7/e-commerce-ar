import 'package:formz/formz.dart';

class PhoneInput extends FormzInput<String, String> {
  PhoneInput.pure() : super.pure('');
  PhoneInput.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'Phone is required';
    }
    if (value.length < 10) {
      return 'Phone length must be greater than 10 character';
    }

    return null;
  }
}
