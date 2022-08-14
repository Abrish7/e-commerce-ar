import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/config.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<PaymentStart>(_onPaymentStart);
    on<PaymentCreateIntent>(_onPaymentCreateIntent);
    on<PaymentConfirmIntent>(_onPaymentConfirmIntent);
  }

  void _onPaymentStart(PaymentStart event, Emitter<PaymentState> emit) {
    emit(state.copyWith(status: PaymentStatus.initial));
  }

  void _onPaymentCreateIntent(
      PaymentCreateIntent event, Emitter<PaymentState> emit) async {
    print("Address: " + event.shippingDetails.address.country.toString());
    emit(state.copyWith(status: PaymentStatus.loading));
    final paymentMethod = await Stripe.instance.createPaymentMethod(
        PaymentMethodParams.card(
            paymentMethodData: PaymentMethodData(
                billingDetails: event.billingDetails,
                shippingDetails: event.shippingDetails)));

    final paymentIntentResults = await _callPayEndPointMethodId(
        useStripeSdk: true,
        paymentMethodId: paymentMethod.id,
        currency: 'usd',
        items: event.items);
    if (paymentIntentResults['error'] != null) {
      emit(state.copyWith(status: PaymentStatus.failure));
    }
    if (paymentIntentResults['clientSecret'] != null &&
        paymentIntentResults['requiresAction'] == null) {
      emit(state.copyWith(status: PaymentStatus.success));
    }

    if (paymentIntentResults['clientSecret'] != null &&
        paymentIntentResults['requiresAction'] == true) {
      final String clientSecret = paymentIntentResults['clientSecret'];
      add(PaymentConfirmIntent(clientSecrete: clientSecret));
    }
  }

  void _onPaymentConfirmIntent(
      PaymentConfirmIntent event, Emitter<PaymentState> emit) async {
    try {
      final paymentIntent =
          await Stripe.instance.handleNextAction(event.clientSecrete);
      if (paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation) {
        Map<String, dynamic> paymentIntentResults =
            await _callPayEndPointIntentId(paymentIntentId: paymentIntent.id);

        if (paymentIntentResults['error'] != null) {
          emit(state.copyWith(status: PaymentStatus.failure));
        }
        if (paymentIntentResults['clientSecret'] != null &&
            paymentIntentResults['requiresAction'] == null) {
          emit(state.copyWith(status: PaymentStatus.success));
        }

        if (paymentIntentResults['clientSecret'] != null &&
            paymentIntentResults['requiresAction'] == true) {
          final String clientSecret = paymentIntentResults['clientSecret'];
          add(PaymentConfirmIntent(clientSecrete: clientSecret));
        }
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PaymentStatus.failure));
    }
  }

  Future<Map<String, dynamic>> _callPayEndPointIntentId(
      {required String paymentIntentId}) async {
    final url = Uri.parse(Configurations().getPaymentIntentURL());

    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'paymentIntentId': paymentIntentId,
        }));

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> _callPayEndPointMethodId(
      {required bool useStripeSdk,
      required String paymentMethodId,
      required String currency,
      List<Map<String, dynamic>>? items}) async {
    final url = Uri.parse(Configurations().getPaymentURL());

    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'useStripeSdk': useStripeSdk,
          'paymentMethodId': paymentMethodId,
          'currency': currency,
          'items': items,
        }));
    return json.decode(response.body);
  }
}
