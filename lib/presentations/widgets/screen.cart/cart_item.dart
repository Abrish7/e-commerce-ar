import 'package:ecommerce_v3/presentations/widgets/screen.cart/cart_quantity_counter.dart';

import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _productImage("assets/images/shoe.png"),
              _productDetails(),
              _productQuantity()
            ],
          )
        ],
      ),
    );
  }

  Widget _productImage(image) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 2.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Image.asset(image),
      ),
    );
  }

  Widget _productDetails() {
    return Container(
      // padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _productName('Name nike'),
          _productPrice('Price \$100.00'),
        ],
      ),
    );
  }

  Widget _productName(name) {
    return Container(
      child: Text(
        name,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }

  Widget _productPrice(price) {
    return Container(
      child: Text(
        price,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),
      ),
    );
  }

  Widget _productQuantity() {
    return CartQuantityCounter(index: 1);
  }
}
