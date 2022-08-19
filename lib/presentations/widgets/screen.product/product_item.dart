import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../data/provider/cart_api.dart';
import '../../../data/repository/cart_repo.dart';
import '../../../logic/cart/load_cart/cart_cubit.dart';
import '../../../logic/cart/total_cart_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    late String customerId = "";
    return Container(
      // padding: EdgeInsets.all(5),

      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            print("index length on item: " +
                state.product[index].image[0].toString());
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _productImage(state.product[index].image[0].toString()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(left: 2.0, top: 5),
                      child: Text(
                        state.product[index].name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(left: 2.0),
                      // margin: EdgeInsets.all(5),
                      child: Text(
                        state.product[index].description,
                        style: TextStyle(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 2.0, top: 5),
                          child: const Text(
                            'ET 100.00',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            print('add to cart pressed from product list...');
                            BlocProvider.of<CartCubit>(context).addToCart(
                                customerId: customerId,
                                productId: state.product[index].id,
                                quantity: 1);
                            BlocProvider.of<TotalCartCubit>(context)
                                .getTotalPrice(customerId: customerId);
                          },
                          label: Text('add to cart'),
                        ),
                      ],
                    ),
                    Container(
                      child: RatingBar.builder(
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
                      ),
                    )
                  ],
                ),
                BlocBuilder<UserCubit, UserState>(builder: ((context, state) {
                  customerId = state.user.id.toString();
                  return Container();
                }))
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  _productImage(image) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 2.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Image.network(image),
      ),
    );
  }
}
