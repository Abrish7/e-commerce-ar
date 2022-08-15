import 'package:formz/formz.dart';

class Line2Input extends FormzInput<String, String> {
  Line2Input.pure() : super.pure('');
  Line2Input.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'line 2 is required';
    }
    if (value.length < 2) {
      return 'line 2 lenght must be greater than 3 character';
    }

    return null;
  }
}
