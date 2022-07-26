import 'package:flutter/material.dart';

import 'product_quantity_counter.dart';
import 'product_favorite_button.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({
    Key? key,
    required this.index,
    required this.scaffoldKey,
  }) : super(key: key);

  final int index;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductQuantityCounter(index: index),
        ProductFavoriteButton(
          index: index,
          isLiked: true,
          scaffoldKey: scaffoldKey,
        )
      ],
    );
  }
}
