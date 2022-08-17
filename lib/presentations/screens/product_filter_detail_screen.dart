import 'package:ecommerce_v3/presentations/widgets/screen.product_filter_by_tag/product_filter_by_tag_app_bar.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product_filter_by_tag/product_filter_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/screen.product_filter_by_tag/product_filter_details_app_bar.dart';

class ProductFilterDetailScreen extends StatelessWidget {
  const ProductFilterDetailScreen({Key? key, required this.index})
      : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: ProductFilterDetailsByTagAppBar(),
          preferredSize: Size.fromHeight(65)),
      body: ProductFilterDetailsWidget(index: index),
    );
  }
}
