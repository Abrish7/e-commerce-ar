import 'package:ecommerce_v3/presentations/widgets/screen.product_sub_category/sub_category_skeloten.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/category/product_category_cubit.dart';
import '../../../logic/sub_category/sub_category_cubit.dart';

class ProductSubCategoryItem extends StatelessWidget {
  ProductSubCategoryItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 15),
      child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
        builder: (context, state) {
          if (state is ProductSubCategoryLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _productImage("assets/images/shoe.png"),
                    Container(
                      // padding: const EdgeInsets.only(left: 5.0, top: 5),
                      child: Text(
                        state.subCategory[index].subCategory.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else if (state is ProductCategoryLoading) {
            return SubCategorySkeleton();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  _productImage(url) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        height: 50,
        width: 80,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Image.asset(url),
      ),
    );
  }
}
