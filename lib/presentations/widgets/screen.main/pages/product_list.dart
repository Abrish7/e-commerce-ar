import 'package:flutter/widgets.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<Object?> navigate(context) {
    return Navigator.of(context).pushNamed('/product');
  }
}
