import 'package:ecommerce_v3/presentations/widgets/screen.home/circular_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/category/product_category_cubit.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({Key? key, required this.index, required this.name})
      : super(key: key);
  final int index;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      // color: Color.fromARGB(209, 255, 255, 255),
      child: BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
        builder: (context, state) {
          state as ProductCategoryLoaded;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              CircularImg(
                  img:
                      'https://thumbs.dreamstime.com/b/vector-shopping-bag-logo-icon-blue-letter-s-detailed-illustration-isolated-white-141489270.jpg',
                  name: name),
              Container(
                padding: const EdgeInsets.only(left: 5.0, top: 10),
                child: Text(
                  state.category[index].name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
