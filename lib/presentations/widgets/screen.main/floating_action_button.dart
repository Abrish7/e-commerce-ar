import 'package:ecommerce_v3/presentations/common/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cart/load_cart/cart_cubit.dart';
import '../../../logic/home/bottom_app_bar_cubit.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          BlocProvider.of<BottomAppBarCubit>(context).setBottomAppBarState(
              BottomAppBarState(
                  isProductClicked: false,
                  isFavClicked: false,
                  isCartClicked: true,
                  isOrderClicked: false,
                  isSettingClicked: false));
        },
        elevation: 5,
        child: BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) => current != previous,
          builder: (context, cartState) {
            return Badge(
              value: "2",
              color: const Color.fromARGB(255, 232, 7, 7),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
            );
          },
        ));

    // const Icon(Icons.add)
  }
}
