import 'package:flutter/material.dart';

import '../widgets/screen.product_sub_category/product_sub_category_top_app_bar.dart';
import '../widgets/screen.product_sub_category/product_sub_category_widget.dart';

class ProductSubCategoryScreen extends StatelessWidget {
  ProductSubCategoryScreen({Key? key}) : super(key: key);
  // String category;
  // String subCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(63.0),
          child: ProductSubCategoryTopAppBar()),
      body: ProductSubCategoryWidget(),
    );
  }
}
