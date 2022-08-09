import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product_detail/product_favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cart/load_cart/cart_cubit.dart';
import '../../../logic/cart/quantity_cubit.dart';

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

          // if (cartState.cart.containsKey(productState.product[index].id)) {
          //   size = cartState.cart[productState.product[index].id]!.quantity;
          // }
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
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, productState) {
            if (productState is ProductLoaded) {
              return BlocBuilder<QuantityCubit, QuantityState>(
                builder: (context, quantityState) {
                  return OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        BlocProvider.of<QuantityCubit>(context)
                            .decreaseQuantityState(
                                customerId: "",
                                quantity: quantityState.quantity,
                                size: productState.product[index].quantity,
                                productId: "",
                                index: 0);
                      },
                      child: Icon(
                        icon,
                        color: Colors.black,
                      ));
                },
              );
            } else {
              return Container();
            }
          },
        ));
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
            return BlocBuilder<QuantityCubit, QuantityState>(
              builder: (context, quantityState) {
                return OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      BlocProvider.of<QuantityCubit>(context)
                          .increaseQuantityState(
                              index: 0,
                              customerId: "",
                              quantity: quantityState.quantity,
                              size: productState.product[index].quantity,
                              productId: "");
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
