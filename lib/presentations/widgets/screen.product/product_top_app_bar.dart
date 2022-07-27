import 'package:ecommerce_v3/logic/product/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        icon: const Icon(Icons.arrow_back, color: Colors.grey),
        onPressed: () {
          Navigator.of(context).pushNamed('/subCategory');
        },
      ),
      actions: [
        IconButton(
            onPressed: () {
              // shoppingCartDialogue(context);
              // showSlidingBottomSheet(context, builder: (context) {
              //   return SlidingSheetDialog(
              //       elevation: 8,
              //       cornerRadius: 16,
              //       builder: (context, state) {
              //         return BottomCartSheet();
              //       });
              // });
            },
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            )),
        BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) => current != previous,
          builder: (context, cartState) {
            return Badge(
              value: (cartState.cart.length - 1).toString(),
              color: const Color.fromARGB(255, 232, 7, 7),
              child: IconButton(
                onPressed: () {
                  // shoppingCartDialogue(context);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
            );
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
