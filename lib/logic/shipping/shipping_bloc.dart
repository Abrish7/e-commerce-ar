import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/logic/shipping/form/city_input.dart';
import 'package:ecommerce_v3/logic/shipping/form/country_input.dart';
import 'package:ecommerce_v3/logic/shipping/form/line2_Input.dart';
import 'package:ecommerce_v3/logic/shipping/form/line_Input.dart';
import 'package:ecommerce_v3/logic/shipping/form/phone_input.dart';
import 'package:ecommerce_v3/logic/shipping/form/postal_code_input.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'shipping_event.dart';
part 'shipping_state.dart';

class ShippingBloc extends Bloc<ShippingEvent, ShippingState> {
  ShippingBloc()
      : super(ShippingState(
            country: CountryInput.pure(),
            city: CityInput.pure(),
            line: LineInput.pure(),
            line2: Line2Input.pure(),
            phone: PhoneInput.pure(),
            postalCodeInput: PostalCodeInput.pure())) {
    on<ShippingEvent>((event, emit) {
      // TODO: implement event handler
      if (event is CountryChanged) {
        emit(_mapCountryChangedToState(event));
      } else if (event is CityChanged) {
        emit(_mapCityChangedToState(event));
      } else if (event is LineChanged) {
        emit(_mapLineChangedToState(event));
      } else if (event is Line2Changed) {
        emit(_mapLine2ChangedToState(event));
      } else if (event is PostalCodeChanged) {
        emit(_mapPostalCodeChangedToState(event));
      } else if (event is PhoneChanged) {
        emit(_mapPhoneChangedToState(event));
      } else if (event is ContinueButtonSubmitted) {
        emit(_mapContinueButtonSubmittedToState(event, emit));
      }
    });
  }

  ShippingState _mapCountryChangedToState(CountryChanged event) {
    final country = CountryInput.dirty(event.country);
    return state.copyWith(country: country, status: Formz.validate([country]));
  }

  ShippingState _mapCityChangedToState(CityChanged event) {
    final city = CityInput.dirty(event.city);
    return state.copyWith(city: city, status: Formz.validate([city]));
  }

  ShippingState _mapLineChangedToState(LineChanged event) {
    final line = LineInput.dirty(event.line);
    return state.copyWith(line: line, status: Formz.validate([line]));
  }

  ShippingState _mapLine2ChangedToState(Line2Changed event) {
    final line2 = Line2Input.dirty(event.line2);
    return state.copyWith(line2: line2, status: Formz.validate([line2]));
  }

  ShippingState _mapPhoneChangedToState(PhoneChanged event) {
    final phone = PhoneInput.dirty(event.phone);
    return state.copyWith(phone: phone, status: Formz.validate([phone]));
  }

  ShippingState _mapPostalCodeChangedToState(PostalCodeChanged event) {
    final postalCode = PostalCodeInput.dirty(event.postalCode);
    return state.copyWith(
        postalCodeInput: postalCode, status: Formz.validate([postalCode]));
  }

  _mapContinueButtonSubmittedToState(event, emit) {
    final country = CountryInput.dirty(state.country.value);
    final city = CityInput.dirty(state.city.value);
    final line = LineInput.dirty(state.line.value);
    final line2 = Line2Input.dirty(state.line2.value);
    final postalCode = PostalCodeInput.dirty(state.postalCodeInput.value);
    final status = Formz.validate([country, city, line, line2, postalCode]);

    try {
      emit(state.copyWith(
          country: country,
          city: city,
          line: line,
          line2: line2,
          postalCodeInput: postalCode));

      if (status.isValidated) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
        ));

        print(
            "shipping info validated " + status.isSubmissionSuccess.toString());
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
