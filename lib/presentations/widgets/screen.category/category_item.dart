import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/product_model.dart';
import '../../../logic/category/product_category_cubit.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key, required this.index}) : super(key: key);
  final int index;
  List<Product> list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
        builder: (context, state) {
          state as ProductCategoryLoaded;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _productImage("assets/images/shoe.png"),
              Container(
                padding: const EdgeInsets.only(left: 5.0, top: 5),
                child: Text(
                  state.category[index].name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _productImage(url) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        height: 150,
        width: 150,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Image.asset(url),
      ),
    );
  }
}
