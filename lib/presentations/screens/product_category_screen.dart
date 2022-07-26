import 'package:ecommerce_v3/presentations/widgets/screen.category/category_top_app_bar.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.category/category_widget.dart';
import 'package:flutter/material.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(63.0), child: CategoryTopAppBar()),
      body: CategoryWidget(),
    );
  }
}
