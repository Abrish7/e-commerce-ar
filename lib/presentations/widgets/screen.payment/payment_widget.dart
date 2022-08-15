import 'package:ecommerce_v3/logic/payment/payment_bloc.dart';
import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.shipping/shipping_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../logic/order/order_cubit.dart';
import '../../../logic/shipping/shipping_bloc.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late String customerEmail = "";
    late String customerId = "";
    late String name = "";
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

                      name = state.user.firstname + ' ' + state.user.lastname;
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
                        borderRadius: 10,
                        textColor: Colors.white,
                        placeholderColor: Colors.grey,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<ShippingBloc, ShippingState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              print(
                                  'All Data ' + _controller.details.toString());
                              (_controller.details.complete)
                                  ? context.read<PaymentBloc>().add(
                                        PaymentCreateIntent(
                                          billingDetails: BillingDetails(
                                              address: Address(
                                                  city: state.city.value,
                                                  country: state.country.value,
                                                  line1: state.line.value,
                                                  line2: state.line2.value,
                                                  postalCode: state
                                                      .postalCodeInput.value,
                                                  state: ""),
                                              email: customerEmail,
                                              phone: state.phone.value,
                                              name: name),
                                          shippingDetails: ShippingDetails(
                                              address: Address(
                                                  city: state.city.value,
                                                  country: state.country.value,
                                                  line1: state.line.value,
                                                  line2: state.line2.value,
                                                  postalCode: state
                                                      .postalCodeInput.value,
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
                                          content: Text(
                                              'The form is not complete.')));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange)),
                            child: Text('Pay'));
                      },
                    ),
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
                        BlocProvider.of<OrderCubit>(context)..getOrder();
                        Navigator.pushNamed(context, '/order');
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
