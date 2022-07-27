// ignore_for_file: deprecated_member_use

import 'package:ecommerce_v3/logic/product/sub_category/sub_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSubCategoryWidget extends StatelessWidget {
  const ProductSubCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
        builder: (context, state) {
          if (state is ProductSubCategoryLoaded) {
            return ListView.builder(
              itemCount: state.subCategory.length,
              itemBuilder: (BuildContext context, int index) => Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: state is ProductSubCategoryLoaded
                          ? RaisedButton(
                              elevation: .5,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, '/product');
                              },
                              child: ListTile(
                                title: Text(
                                    state.subCategory[index].subCategory
                                        .toString(),
                                    style: TextStyle(fontSize: 20)),
                                subtitle:
                                    Text(state.subCategory[index].category),
                                // onTap: () {
                                //   print('sub category pressed');
                                // },
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ))),
            );
          } else if (state is ProductSubCategoryLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}
