import 'package:ecommerce_v3/logic/cart/load_cart/cart_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.79,
      child: _buildCartList(),
    );
  }

  Widget _buildCartList() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return ListView.builder(
              itemCount: state.cart.cart[0].products.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                      elevation: 0.8,
                      color: Colors.white,
                      onPressed: () {},
                      child: CartItem(index: index)),
                );
              });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
