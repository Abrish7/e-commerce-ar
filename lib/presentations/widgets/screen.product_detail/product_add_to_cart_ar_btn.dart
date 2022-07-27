import 'package:ecommerce_v3/logic/product/cart/quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/cart_model.dart';
import '../../../../logic/product/cart/cart_cubit.dart';
import '../../../../logic/product/product_cubit.dart';

class ProductAddToCartAndARBtn extends StatelessWidget {
  const ProductAddToCartAndARBtn(
      {required this.index, required this.scaffoldKey});
  final int index;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            height: 50,
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: const Color.fromARGB(255, 165, 28, 28),
                onPressed: () {
                  Navigator.pushNamed(context, '/ar');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Ar-Try On',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.camera_front,
                      color: Colors.white,
                    )
                  ],
                )),
          ),
          Expanded(
            child: SizedBox(
                height: 50,
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: ((context, productState) {
                    productState as ProductLoaded;
                    return BlocBuilder<QuantityCubit, QuantityState>(
                        builder: (context, quantityState) {
                      return BlocBuilder<CartCubit, CartState>(
                          builder: (context, cartState) {
                        return FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // color: productState.product[index].color,
                            onPressed: () {
                              if (cartState.cart.containsKey(
                                  productState.product[index].id)) {
                                buildSnackBar(productState,
                                    'already added to cart.', Colors.red);
                              } else {
                                BlocProvider.of<CartCubit>(context)
                                    .setCartState(Cart(
                                        productId: 10,
                                        quantity: quantityState.quantity));
                                buildSnackBar(productState, 'added to cart.',
                                    Colors.blue);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                )
                              ],
                            ));
                      });
                    });
                  }),
                )),
          )
        ],
      ),
    );
  }

  void buildSnackBar(ProductLoaded productState, String append, Color color) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000),
        backgroundColor: color,
        content: Text(
          "product ${productState.product[index].name} $append",
          style: const TextStyle(color: Colors.white),
        )));
  }
}
