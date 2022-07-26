import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: ((context, state) {
      state as ProductLoaded;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          state.product[index].description,
          style: const TextStyle(height: 1.5),
        ),
      );
    }));
  }
}
