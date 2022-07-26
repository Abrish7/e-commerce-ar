import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatefulWidget {
  int index;
  ProductItem(this.index, {Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState(index);
}

class _ProductItemState extends State<ProductItem> {
  int index;

  _ProductItemState(this.index);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoaded) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/product_detail', arguments: index);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: state.product[index].color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(state.product[index].image),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  state.product[index].name.toString(),
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
              Text(
                state.product[index].price.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
