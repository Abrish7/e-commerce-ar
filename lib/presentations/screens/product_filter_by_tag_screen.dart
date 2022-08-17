import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/screen.product_filter_by_tag/product_filter_by_tag_app_bar.dart';
import '../widgets/screen.product_filter_by_tag/product_filter_by_tag_widget.dart';

class ProductFilterByTagScreen extends StatelessWidget {
  const ProductFilterByTagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: ProductFilterByTagAppBar(),
        preferredSize: Size.fromHeight(65),
      ),
      body: ProductFilterByTagWidget(),
    );
  }
}
