import 'package:ecommerce_v3/presentations/common/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../logic/shipping/shipping_bloc.dart';

class ShippingForm extends StatelessWidget {
  const ShippingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: BlocBuilder<ShippingBloc, ShippingState>(
              builder: (context, state) {
                return TextFormField(
                  decoration: ThemeHelper().textInputDecoration(
                      'Country',
                      'Country is required',
                      state.country.error.toString(),
                      state.country.invalid,
                      const Icon(Icons.text_format)),
                  onChanged: (value) => BlocProvider.of<ShippingBloc>(context)
                      .add(CountryChanged(country: value)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: BlocBuilder<ShippingBloc, ShippingState>(
              builder: (context, state) {
                return TextFormField(
                  decoration: ThemeHelper().textInputDecoration(
                      'City',
                      'City is required',
                      state.city.error.toString(),
                      state.city.invalid,
                      const Icon(Icons.text_format)),
                  onChanged: (value) => BlocProvider.of<ShippingBloc>(context)
                      .add(CityChanged(city: value)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: BlocBuilder<ShippingBloc, ShippingState>(
              builder: (context, state) {
                return TextFormField(
                  decoration: ThemeHelper().textInputDecoration(
                      'Line',
                      'Line is required',
                      state.line.error.toString(),
                      state.line.invalid,
                      const Icon(Icons.text_format)),
                  onChanged: (value) => BlocProvider.of<ShippingBloc>(context)
                      .add(LineChanged(line: value)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: BlocBuilder<ShippingBloc, ShippingState>(
              builder: (context, state) {
                return TextFormField(
                  decoration: ThemeHelper().textInputDecoration(
                      'Line 2',
                      'Line 2 is required',
                      state.line2.error.toString(),
                      state.line2.invalid,
                      const Icon(Icons.text_format)),
                  onChanged: (value) => {
                    BlocProvider.of<ShippingBloc>(context)
                        .add(Line2Changed(line2: value))
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: BlocBuilder<ShippingBloc, ShippingState>(
              builder: (context, state) {
                return TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: ThemeHelper().textInputDecoration(
                      'Postal code',
                      'Postal code is required',
                      state.postalCodeInput.error.toString(),
                      state.postalCodeInput.invalid,
                      const Icon(Icons.text_format)),
                  onChanged: (value) => BlocProvider.of<ShippingBloc>(context)
                      .add(PostalCodeChanged(postalCode: value)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: BlocBuilder<ShippingBloc, ShippingState>(
              builder: (context, state) {
                return TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: ThemeHelper().textInputDecoration(
                      'Phone',
                      'Phone is required',
                      state.phone.error.toString(),
                      state.phone.invalid,
                      const Icon(Icons.text_format)),
                  onChanged: (value) => BlocProvider.of<ShippingBloc>(context)
                      .add(PhoneChanged(phone: value)),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BlocConsumer<ShippingBloc, ShippingState>(
            listener: (context, state) {
              // TODO: implement listener
              print('from shipping widget ===----> ' +
                  state.country.value.toString());
              if (state.status == FormzStatus.submissionSuccess) {
                Navigator.of(context).pushNamed('/payment_type');
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  if (!(state.status == FormzStatus.submissionSuccess)) {
                    BlocProvider.of<ShippingBloc>(context)
                        .add((ContinueButtonSubmitted()));
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Text(
                    'continue to checkout',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
