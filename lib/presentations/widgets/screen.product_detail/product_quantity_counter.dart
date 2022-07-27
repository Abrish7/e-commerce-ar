import 'package:ecommerce_v3/logic/product/cart/cart_cubit.dart';
import 'package:ecommerce_v3/logic/product/cart/quantity_cubit.dart';
import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product_detail/product_favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantityCounter extends StatelessWidget {
  const ProductQuantityCounter({Key? key, required this.index})
      : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
        builder: (context, productState) {
      productState as ProductLoaded;
      return BlocBuilder<QuantityCubit, QuantityState>(
          builder: ((context, quantityState) {
        return BlocBuilder<CartCubit, CartState>(builder: (context, cartState) {
          int size = quantityState.quantity;

          if (cartState.cart.containsKey(productState.product[index].id)) {
            size = cartState.cart[productState.product[index].id]!.quantity;
          }
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    ProductFavoriteButton(index: index, isLiked: false)
                  ],
                ),
                Row(children: <Widget>[
                  builtOutlinedButtonRemove(
                      icon: Icons.remove,
                      size: quantityState.quantity,
                      context: context),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        size.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      )),
                  builtOutlinedButtonAdd(
                      icon: Icons.add,
                      size: quantityState.quantity,
                      context: context),
                ]),
              ],
            ),
          );
        });
      }));
    });
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
              BlocProvider.of<QuantityCubit>(context).decreaseQuantityState();
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
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, productState) {
            productState as ProductLoaded;
            return BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                bool isInCart = false;
                int cartSize = 0;
                if (state.cart.containsKey(productState.product[index].id)) {
                  isInCart = true;
                  cartSize = 2;
                }

                return OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      BlocProvider.of<QuantityCubit>(context)
                          .increaseQuantityState(
                              isInCart: isInCart, inCartSize: cartSize);
                    },
                    child: Icon(
                      icon,
                      color: Colors.black,
                    ));
              },
            );
          },
        ));
  }
}
