import 'package:ecommerce_v3/logic/cart/load_cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/badge.dart';

class CategoryTopAppBar extends StatelessWidget {
  const CategoryTopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 300.0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Category',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushNamed("/home");
          },
        ),
        actions: [
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
        ]);
  }
}
