import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cart/load_cart/cart_cubit.dart';
import '../../common/badge.dart';

class PaymentTopAppBar extends StatelessWidget {
  const PaymentTopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Payment',
        style: TextStyle(color: Colors.black),
      ),
      toolbarHeight: 300.0,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pushNamed('/payment_type');
        },
      ),
      actions: [
        BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) => current != previous,
          builder: (context, cartState) {
            return Badge(
              value: cartState.cart.length.toString(),
              color: const Color.fromARGB(255, 232, 7, 7),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cart');
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
