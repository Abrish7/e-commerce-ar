import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product/product_widget.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product/product_top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductCubit>(context).loadProduct();
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(63.0),
          child: ProductTopAppBar(),
        ),
        body: ProductWidget());
  }
}
