// ignore_for_file: deprecated_member_use

import 'package:ecommerce_v3/logic/category/product_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/product/product_filter_by_category_cubit.dart';
import '../../../logic/sub_category/sub_category_cubit.dart';
import '../../common/screen_arguments.dart';

class ProductSubCategoryWidget extends StatelessWidget {
  ProductSubCategoryWidget({Key? key}) : super(key: key);
  // String category;
  // String subCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
          builder: (context, categoryState) {
        if (categoryState is ProductCategoryLoaded) {
          return BlocBuilder<SubCategoryCubit, SubCategoryState>(
            builder: (context, state) {
              if (state is ProductSubCategoryLoaded) {
                return ListView.builder(
                  itemCount: state.subCategory.length,
                  itemBuilder: (BuildContext context, int index) => Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          // ignore: unnecessary_type_check
                          child: state is ProductSubCategoryLoaded
                              ? RaisedButton(
                                  elevation: .5,
                                  color: Colors.white,
                                  onPressed: () {
                                    BlocProvider.of<
                                                ProductFilterByCategoryCubit>(
                                            context)
                                        .loadProduct(
                                            category: state
                                                .subCategory[index].category,
                                            subCategory: state
                                                .subCategory[index]
                                                .subCategory);

                                    Navigator.pushNamed(
                                      context,
                                      '/product_filter',
                                      arguments: Category(
                                          category:
                                              state.subCategory[index].category,
                                          subCategory: state
                                              .subCategory[index].subCategory),
                                    );
                                  },
                                  child: ListTile(
                                    title: Text(
                                        state.subCategory[index].subCategory
                                            .toString(),
                                        style: TextStyle(fontSize: 20)),
                                    subtitle:
                                        Text(state.subCategory[index].category),
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                ))),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          );
        }
        return Container();
      }),
    );
  }
}
