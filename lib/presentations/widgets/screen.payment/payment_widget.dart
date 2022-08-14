import 'package:ecommerce_v3/logic/payment/payment_bloc.dart';
import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late String customerEmail = "";
    late String customerId = "";
    return Container(
        alignment: Alignment.center,
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            CardFormEditController _controller = CardFormEditController(
                initialDetails: state.cardFieldInputDetails);
            if (state.status == PaymentStatus.initial) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      customerEmail = state.user.email;
                      customerId = state.user.id;
                      return Container();
                    },
                  ),
                  Text(
                    'Stripe Form',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CardFormField(
                    controller: _controller,
                    style: CardFormStyle(
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        placeholderColor: Colors.grey.shade50,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          print('All Data ' + _controller.details.toString());
                          (_controller.details.complete)
                              ? context.read<PaymentBloc>().add(
                                    PaymentCreateIntent(
                                      billingDetails: BillingDetails(
                                          address: Address(
                                              city: "Bahirdar",
                                              country: "Ethiopia",
                                              line1: "poly",
                                              line2: "",
                                              postalCode: "0000",
                                              state: ""),
                                          email: customerEmail,
                                          phone: "0921093355",
                                          name: "Abraham"),
                                      shippingDetails: ShippingDetails(
                                          address: Address(
                                              city: "Bahirdar",
                                              country: "Ethiopia",
                                              line1: "poly",
                                              line2: "",
                                              postalCode: "0000",
                                              state: "")),
                                      items: [
                                        {'id': 2},
                                        {'id': 3},
                                        {'id': 4},
                                      ],
                                      customerId: customerId,
                                      // {'id': 2},
                                    ),
                                  )
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('The form is not complete.')));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        child: Text('Pay')),
                  )
                ],
              );
            }
            if (state.status == PaymentStatus.success) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'The payment is successful.',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<PaymentBloc>().add(PaymentStart());
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      child: Text('Done')),
                ],
              );
            }
            if (state.status == PaymentStatus.failure) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'The payment is failed.',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<PaymentBloc>().add(PaymentStart());
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[300])),
                      child: Text('Try again')),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
