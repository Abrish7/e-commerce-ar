import 'package:ecommerce_v3/logic/tag/tag_product_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.product_filter_by_tag/product_tag_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFilterByTagWidget extends StatelessWidget {
  const ProductFilterByTagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<TagProductCubit, TagProductState>(
          builder: (context, state) {
        if (state is TagProductLoaded) {
          return _gridViewBuilder(state, context);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  Widget _gridViewBuilder(TagProductLoaded state, context) {
    return GridView.builder(
      itemCount: state.product.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return _tagProductFilterItem(index, context);
      },
    );
  }

  Widget _tagProductFilterItem(index, context) {
    return Container(
      child: RaisedButton(
          elevation: 1,
          color: Colors.grey[100],
          onPressed: () {
            Navigator.of(context)
                .pushNamed('/product_filter_detail', arguments: index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProductTagItem(index: index),
                ],
              ),
            ],
          )),
    );
  }
}
