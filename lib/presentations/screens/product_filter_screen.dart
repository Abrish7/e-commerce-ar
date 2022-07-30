import 'package:ecommerce_v3/logic/product/product_filter_by_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/screen.product_filter/product_filter_top_app_bar.dart';
import '../widgets/screen.product_filter/product_filter_widget.dart';

// ignore: must_be_immutable
class ProductFilterScreen extends StatelessWidget {
  ProductFilterScreen(
      {Key? key, required this.category, required this.subCategory})
      : super(key: key);
  String category;
  String subCategory;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductFilterByCategoryCubit>(context)
        .loadProduct(category: category, subCategory: subCategory);

    return Scaffold(
      appBar: PreferredSize(
          child: const ProductFilterTopAppBar(),
          preferredSize: Size.fromHeight(65)),
      body: ProductFilterWidget(category: category, subCategory: subCategory),
    );
  }
}
