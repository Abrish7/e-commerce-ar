// ignore_for_file: deprecated_member_use

import 'package:ecommerce_v3/logic/product/product_filter_by_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_filter_item.dart';

class ProductFilterWidget extends StatefulWidget {
  final String category;
  final String subCategory;
  ProductFilterWidget({
    Key? key,
    required this.category,
    required this.subCategory,
  }) : super(key: key);

  @override
  State<ProductFilterWidget> createState() =>
      _ProductFilterWidgetState(category, subCategory);
}

class _ProductFilterWidgetState extends State<ProductFilterWidget> {
  late int currentIndex = 0;
  final scrollController = ScrollController();
  final String category;
  final String subCategory;

  _ProductFilterWidgetState(this.category, this.subCategory);

  @override
  Widget build(BuildContext context) {
    print("category from filter page " + category);
    print("sub category from filter page " + subCategory);

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _productList());
  }

  Widget _productList() {
    return BlocBuilder<ProductFilterByCategoryCubit,
        ProductFilterByCategoryState>(builder: (context, state) {
      if (state is ProductFilterByCategoryLoaded) {
        print("value " + state.product.length.toString());
        return ListView.separated(
          controller: scrollController,
          itemCount: state.product.length,
          itemBuilder: ((context, index) {
            return RaisedButton(
                elevation: 0.5,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/product_detail', arguments: index);
                },
                child: ProductFilterItem(index: index));
          }),
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.white,
            );
          },
        );
      } else if (state is ProductFilterByCategoryLoading) {
        return Center(child: CircularProgressIndicator());
      }
      return Center(
        child: Container(),
      );
    });
  }
}
