import 'package:formz/formz.dart';

class LineInput extends FormzInput<String, String> {
  LineInput.pure() : super.pure('');
  LineInput.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'line is required';
    }
    if (value.length < 2) {
      return 'line lenght must be greater than 3 character';
    }
    return null;
  }
}
