import 'package:formz/formz.dart';

class CityInput extends FormzInput<String, String> {
  CityInput.pure() : super.pure('');
  CityInput.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'city is required';
    }
    if (value.length < 2) {
      return 'city length must be greater than 2 character';
    }

    return null;
  }
}
