import 'package:ecommerce_v3/logic/cart/load_cart/cart_cubit.dart';
import 'package:ecommerce_v3/logic/cart/quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartQuantityCounter extends StatelessWidget {
  CartQuantityCounter(
      {Key? key,
      required this.index,
      required this.productId,
      required this.quantity})
      : super(key: key);
  final int index;
  final String productId;
  // final String customerId;
  late int quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: <Widget>[
            builtOutlinedButtonRemove(
                icon: Icons.remove, size: 1, context: context),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    // BlocBuilder<QuantityCubit, QuantityState>(
                    //   // Building only this index
                    //   buildWhen: (previous, current) =>
                    //       current.productId == productId,
                    //   builder: (context, quantityState) {
                    //     quantity = quantityState.quantity;
                    // Display Quantity
                    Text(
                  quantity.toString(),
                  style: Theme.of(context).textTheme.headline6,
                )
                //   },
                ),
            // })),
            builtOutlinedButtonAdd(icon: Icons.add, size: 10, context: context),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                // if (state is CartLoaded) {
                // BlocProvider.of<QuantityCubit>(context)
                //   ..setQuantity(
                //       customerId: this.customerId,
                //       quantity: state.cart.cart[0].products[index].quantity,
                //       size:
                //           state.cart.cart[0].products[index].productId.quantity,
                //       productId: this.productId,
                //       isEdited: true);
                // // }
                return Container();
              },
            )
          ]),
        ],
      ),
    );
  }

  SizedBox builtOutlinedButtonRemove(
      {required IconData icon,
      required BuildContext context,
      required int size}) {
    return SizedBox(
        width: 55,
        height: 32,
        child: OutlinedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              BlocProvider.of<CartCubit>(context).updateCart(
                  // customerId: customerId,
                  productId: productId,
                  quantity: quantity + 1);
              // BlocProvider.of<QuantityCubit>(context).decreaseQuantityState(
              //     customerId: this.customerId,
              //     quantity: quantity,
              //     size: 10,
              //     productId: this.productId,
              //     index: index);
              // print('counter -- : ... ' + index.toString());
            },
            child: Icon(
              icon,
              color: Colors.black,
            )));
  }

  SizedBox builtOutlinedButtonAdd(
      {required IconData icon,
      required BuildContext context,
      required int size}) {
    return SizedBox(
        width: 55,
        height: 32,
        child: OutlinedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              BlocProvider.of<CartCubit>(context).updateCart(
                  // customerId: customerId,
                  productId: productId,
                  quantity: quantity + 1);

              // BlocProvider.of<QuantityCubit>(context).increaseQuantityState(
              //     index: index,
              //     customerId: this.customerId,
              //     quantity: quantity,
              //     size: 10,
              //     productId: this.productId);
              // print('counter ++ : ... ' + index.toString());
            },
            child: Icon(
              icon,
              color: Colors.black,
            )));
  }
}
