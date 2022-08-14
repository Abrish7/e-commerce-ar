part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PaymentStart extends PaymentEvent {}

class PaymentCreateIntent extends PaymentEvent {
  final BillingDetails billingDetails;
  final ShippingDetails shippingDetails;
  final String customerId;
  final List<Map<String, dynamic>> items;

  PaymentCreateIntent(
      {required this.billingDetails,
      required this.items,
      required this.shippingDetails,
      required this.customerId});

  @override
  List<Object> get props => [billingDetails, items];
}

class PaymentConfirmIntent extends PaymentEvent {
  final String clientSecrete;

  const PaymentConfirmIntent({required this.clientSecrete});

  @override
  List<Object> get props => [clientSecrete];
}
