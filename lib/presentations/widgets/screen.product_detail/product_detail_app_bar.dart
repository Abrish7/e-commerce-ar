import 'package:ecommerce_v3/presentations/common/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/product/product_cubit.dart';
import '../../../logic/cart/load_cart/cart_cubit.dart';
import '../../../logic/cart/quantity_cubit.dart';

class ProductDetailTopAppBar extends StatelessWidget {
  final int index;
  ProductDetailTopAppBar(this.index);
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: ((context, state) {
      if (state is ProductLoaded) {
        return AppBar(
          // toolbarHeight: 300.0,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "product details",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              BlocProvider.of<QuantityCubit>(context).resetQuantityState();
              Navigator.of(context).pushNamed('/product');
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
                }),
          ],
        );
      }
      return Center(
        child: const CircularProgressIndicator(),
      );
    }));
  }
}
