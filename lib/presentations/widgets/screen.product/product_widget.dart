import 'dart:async';

import 'package:ecommerce_v3/data/model/product_model.dart';
import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key? key}) : super(key: key);
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late int currentIndex = 0;
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ProductCubit>(context).loadProduct();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _productList());
  }

  Widget _productList() {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoading && state.isFirstFetch) {
        return _loadingIndicator();
      }

      List<Product> products = [];
      bool isLoading = false;

      if (state is ProductLoading) {
        products = state.oldProducts;
        isLoading = true;
      } else if (state is ProductLoaded) {
        products = state.product;
      }

      return state is ProductLoaded
          ? ListView.separated(
              controller: scrollController,
              itemBuilder: ((context, index) {
                if (index < products.length) {
                  return RaisedButton(
                      elevation: 0.5,
                      color: Colors.white,
                      onPressed: () {},
                      child: ProductItem(index: index));
                } else {
                  Timer(Duration(milliseconds: 200), () {
                    scrollController
                        .jumpTo(scrollController.position.maxScrollExtent);
                  });
                  return _loadingIndicator();
                }
                // return _product(products[index], context);
              }),
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.white,
                );
              },
              itemCount: products.length + (isLoading ? 1 : 0))
          : const Center(child: CircularProgressIndicator());
    });
  }

  Widget _loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
