import 'package:ecommerce_v3/presentations/widgets/screen.cart/cart_bottom_sheet.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.cart/cart_top_app_bar.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.cart/cart_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
          child: CartTopAppBar(), preferredSize: Size.fromHeight(65.0)),
      body: CartWidget(),
      bottomSheet: CartBottomSheet(),
    );
  }
}
