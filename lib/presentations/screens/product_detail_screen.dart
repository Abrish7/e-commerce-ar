import 'package:ecommerce_v3/logic/product/product_cubit.dart';

import 'package:ecommerce_v3/presentations/widgets/screen.product_detail/product_detail_app_bar.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product_detail/product_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final int index;
  ProductDetailScreen({Key? key, required this.index}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: ((context, state) {
      if (state is ProductLoaded) {
        return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(63.0),
              child: ProductDetailTopAppBar(index),
            ),
            body: ProductDetailsWidget(index: index)
            // ProductDetailBody(index, _scaffoldKey),
            );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    }));
  }
}
