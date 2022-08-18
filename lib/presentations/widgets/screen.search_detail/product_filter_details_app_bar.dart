import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cart/load_cart/cart_cubit.dart';
import '../../common/badge.dart';

class ProductFilterDetailsByTagAppBar extends StatelessWidget {
  const ProductFilterDetailsByTagAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 300.0,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pushNamed('/product_filter_by_tag');
        },
      ),
      actions: [
        IconButton(
            onPressed: () {
              //  Navigator.of(context).pushNamed('/home');
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            )),
        BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) => current != previous,
            builder: (context, cartState) {
              return Badge(
                value: cartState.cart.length.toString(),
                color: Color.fromARGB(255, 255, 0, 0),
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
            })
      ],
    );
  }
}
