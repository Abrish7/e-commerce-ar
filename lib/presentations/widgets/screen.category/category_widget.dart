import 'package:ecommerce_v3/logic/product/category/product_category_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.category/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/product/sub_category/sub_category_cubit.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
        builder: (context, state) {
          if (state is ProductCategoryLoaded) {
            return GridView.builder(
              itemCount: state.category.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) => Center(
                  child: Container(
                      width: 200,
                      height: 200,
                      child: state is ProductCategoryLoaded
                          ? RaisedButton(
                              elevation: 0,
                              color: Colors.white,
                              onPressed: () {
                                BlocProvider.of<SubCategoryCubit>(context)
                                    .setProductSubCategoryLoaded(
                                        subCategory: state.category[index].name
                                            .toString());
                                Navigator.of(context).pushNamed('/subCategory');
                              },
                              child: CategoryItem(index: index))
                          : Center(
                              child: CircularProgressIndicator(),
                            ))),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
