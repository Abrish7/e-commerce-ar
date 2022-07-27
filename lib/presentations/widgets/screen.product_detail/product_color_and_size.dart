import 'package:ecommerce_v3/presentations/widgets/screen.product_detail/product_dot.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product_detail/product_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/product/product_cubit.dart';

class ProductColorAndSize extends StatelessWidget {
  const ProductColorAndSize({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: ((context, state) {
      state as ProductLoaded;
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Color'),
                    Row(
                      children: [
                        ColorDot(
                          // color: state.product[index].color,
                          color: Colors.blue,
                          isSelected: true,
                        ),
                        const ColorDot(
                          color: Colors.blue,
                          isSelected: false,
                        ),
                        const ColorDot(
                          color: Colors.orange,
                          isSelected: false,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(text: "Size\n"),
                      TextSpan(
                          text: "${"12"} cm",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold))
                    ])),
              )
            ],
          )
        ],
      );
    }));
  }
}
