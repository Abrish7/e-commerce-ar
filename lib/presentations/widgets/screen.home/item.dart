import 'package:ecommerce_v3/data/model/product_model.dart';
import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/theme_helper.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _productImage(state.product[index].image[0].toString()),
                    Container(
                      width: 150,
                      // height: 300,
                      padding: const EdgeInsets.only(left: 10.0, top: 5),
                      child: Text(
                        state.product[index].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 150,
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        state.product[index].description,
                        style: TextStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0, top: 5),
                      child: const Text(
                        '152000.00 BR',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    RatingBar.builder(
                      itemSize: 20,
                      glowRadius: 5,
                      initialRating: 1,
                      minRating: 2,
                      glow: true,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 5),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 5,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }

  _productImage(image) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Image.network(image),
      ),
    );
  }
}
