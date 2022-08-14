import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/product/product_cubit.dart';
import '../../../data/provider/cart_api.dart';
import '../../../data/repository/cart_repo.dart';
import '../../../logic/cart/load_cart/cart_cubit.dart';
import '../../../logic/cart/quantity_cubit.dart';

class ProductAddToCartAndARBtn extends StatelessWidget {
  const ProductAddToCartAndARBtn({
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    late String customerId = "";
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20),
            // height: 50,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  maximumSize: MaterialStateProperty.all(Size.infinite),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                icon: Icon(Icons.camera),
                onPressed: () {
                  Navigator.pushNamed(context, '/ar');
                },
                label: Container(
                  // width: MediaQuery.of(context).size.width * 3,
                  padding: const EdgeInsets.all(15.0),
                  // margin: EdgeInsets.all(20),
                  child: Text(
                    'Ar-Try On',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: SizedBox(
                // height: 30,
                width: double.infinity,
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: ((context, productState) {
                    productState as ProductLoaded;
                    return BlocBuilder<QuantityCubit, QuantityState>(
                        builder: (context, quantityState) {
                      return BlocBuilder<CartCubit, CartState>(
                          builder: (context, cartState) {
                        return ElevatedButton.icon(
                          style: ButtonStyle(
                              maximumSize:
                                  MaterialStateProperty.all(Size.infinite),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            print("add to cart button pressed");
                            BlocProvider.of<CartCubit>(context).addToCart(
                                customerId: customerId,
                                productId: productState.product[index].id,
                                quantity: 5);
                            print('product loading ...');
                            print(' Customer ID: ' + customerId);
                            BlocProvider<CartCubit>(
                                create: (context) => CartCubit(
                                    CartRepository(cartApi: CartApi()))
                                  ..addToCart(
                                      customerId: customerId,
                                      productId: productState.product[index].id,
                                      quantity: 5));
                          },
                          label: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                      });
                    });
                  }),
                )),
          ),
          BlocBuilder<UserCubit, UserState>(builder: ((context, state) {
            customerId = state.user.id.toString();
            return Container();
          }))
        ],
      ),
    );
  }

  void buildSnackBar(ProductLoaded productState, String append, Color color) {
    // scaffoldKey.currentState!.showSnackBar(SnackBar(
    //     duration: Duration(milliseconds: 1000),
    //     backgroundColor: color,
    //     content: Text(
    //       "product ${productState.product[index].name} $append",
    //       style: const TextStyle(color: Colors.white),
    //     )));
  }
}
