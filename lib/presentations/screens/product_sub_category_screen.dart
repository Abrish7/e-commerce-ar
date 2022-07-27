import 'package:flutter/material.dart';

import '../widgets/screen.product_sub_category/product_sub_category_top_app_bar.dart';
import '../widgets/screen.product_sub_category/product_sub_category_widget.dart';

class ProductSubCategoryScreen extends StatelessWidget {
  const ProductSubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(63.0),
          child: ProductSubCategoryTopAppBar()),
      body: ProductSubCategoryWidget(),
    );
  }
}
