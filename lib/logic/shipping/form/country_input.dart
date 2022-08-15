import 'package:formz/formz.dart';

class CountryInput extends FormzInput<String, String> {
  CountryInput.pure() : super.pure('');
  CountryInput.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'country is required';
    }
    if (value.length < 2) {
      return 'Country length must be greater than 2 character';
    }

    return null;
  }
}
