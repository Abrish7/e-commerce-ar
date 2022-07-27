import 'package:ecommerce_v3/presentations/widgets/screen.cart/cart_item.dart';
import 'package:flutter/material.dart';

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
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, state) {
          return Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: RaisedButton(
                elevation: 0.8,
                color: Colors.white,
                onPressed: () {},
                child: CartItem()),
          );
        });
  }
}
