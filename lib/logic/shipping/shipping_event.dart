part of 'shipping_bloc.dart';

abstract class ShippingEvent extends Equatable {
  const ShippingEvent();

  @override
  List<Object?> get props => [];
}

class PostalCodeChanged extends ShippingEvent {
  final String postalCode;
  const PostalCodeChanged({required this.postalCode});

  @override
  List<Object?> get props => [postalCode];
}

class CityChanged extends ShippingEvent {
  final String city;
  const CityChanged({required this.city});

  @override
  List<Object?> get props => [city];
}

class CountryChanged extends ShippingEvent {
  final String country;
  const CountryChanged({required this.country});

  @override
  List<Object?> get props => [country];
}

class LineChanged extends ShippingEvent {
  final String line;
  const LineChanged({required this.line});

  @override
  List<Object?> get props => [line];
}

class Line2Changed extends ShippingEvent {
  final String line2;
  const Line2Changed({required this.line2});

  @override
  List<Object?> get props => [line2];
}

class PhoneChanged extends ShippingEvent {
  final String phone;
  const PhoneChanged({required this.phone});
  @override
  List<Object?> get props => [];
}

class ContinueButtonSubmitted extends ShippingEvent {
  @override
  List<Object?> get props => [];
}

class ShippingError extends ShippingEvent {
  @override
  List<Object?> get props => [];
}
