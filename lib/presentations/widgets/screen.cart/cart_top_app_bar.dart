import 'package:ecommerce_v3/logic/cart/load_cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartTopAppBar extends StatelessWidget {
  const CartTopAppBar({Key? key}) : super(key: key);
  @override
  // ignore: todo
  // TODO: implement preferredSize
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 300.0,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'your cart',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pushNamed('/home');
        },
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            )),
        BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) => current != previous,
          builder: (context, cartState) {
            return Container();
            // return Badge(
            //   value: (cartState.cart.length - 1).toString(),
            //   color: const Color.fromARGB(255, 232, 7, 7),
            //   child: IconButton(
            //     onPressed: () {},
            //     icon: const Icon(
            //       Icons.shopping_cart,
            //       color: Colors.black,
            //     ),
            //   ),
            // );
          },
        )
      ],
    );
  }

  Future<dynamic> shoppingCartDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("shopping cart"),
              content: SingleChildScrollView(
                  child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[Text('data')],
              )),
            ));
  }
}
