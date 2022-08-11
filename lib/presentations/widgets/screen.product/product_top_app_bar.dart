import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/cart/load_cart/cart_cubit.dart';
import '../../common/badge.dart';

class ProductTopAppBar extends StatelessWidget {
  const ProductTopAppBar({Key? key}) : super(key: key);
  @override
  // ignore: todo
  // TODO: implement preferredSize
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 300.0,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pushNamed('/subCategory');
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
