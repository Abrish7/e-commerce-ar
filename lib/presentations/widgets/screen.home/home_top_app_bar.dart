import 'package:ecommerce_v3/logic/cart/load_cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/badge.dart';

class HomeTopAppBar extends StatelessWidget {
  HomeTopAppBar({Key? key, required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      // toolbarHeight: 300.0,
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'e-shop',
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/search');
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
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
      // bottom: TabBar(tabs: [FilterType()])
    );
  }
}
