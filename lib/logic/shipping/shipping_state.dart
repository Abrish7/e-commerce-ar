part of 'shipping_bloc.dart';

class ShippingState extends Equatable {
  final CountryInput country;
  final CityInput city;
  final LineInput line;
  final Line2Input line2;
  final PostalCodeInput postalCodeInput;
  final PhoneInput phone;
  final FormzStatus status;
  const ShippingState(
      {required this.country,
      required this.city,
      required this.line,
      required this.line2,
      required this.postalCodeInput,
      required this.phone,
      this.status = FormzStatus.pure});
  ShippingState copyWith(
      {CountryInput? country,
      CityInput? city,
      LineInput? line,
      Line2Input? line2,
      PostalCodeInput? postalCodeInput,
      PhoneInput? phone,
      FormzStatus? status}) {
    return ShippingState(
        country: country ?? this.country,
        city: city ?? this.city,
        line: line ?? this.line,
        line2: line2 ?? this.line2,
        postalCodeInput: postalCodeInput ?? this.postalCodeInput,
        phone: phone ?? this.phone,
        status: status ?? this.status);
  }

  @override
  List<Object> get props =>
      [country, city, line, line2, postalCodeInput, status, phone];
}
