import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:ecommerce_v3/logic/tag/tag_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../logic/cart/load_cart/cart_cubit.dart';
import '../../../logic/cart/total_cart_cubit.dart';

class ProductTagItem extends StatelessWidget {
  const ProductTagItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    String customerId = '';
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: BlocBuilder<TagProductCubit, TagProductState>(
        builder: (context, state) {
          if (state is TagProductLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _productImage(state.product[index].images[0].toString()),
                Container(
                  width: 150,
                  // height: 300,
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: Text(
                    state.product[index].name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  child: Text(
                    state.product[index].price.$numberDecimal.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(40, 40)),
                          alignment: AlignmentGeometry.lerp(
                              Alignment.center, Alignment.center, 10.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        print('add to cart pressed from product list...');
                        BlocProvider.of<CartCubit>(context).addToCart(
                            customerId: customerId,
                            productId: state.product[index].id,
                            quantity: 1);
                        BlocProvider.of<TotalCartCubit>(context)
                            .getTotalPrice(customerId: customerId);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      label: Text(
                        '+',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                BlocBuilder<UserCubit, UserState>(builder: (context, user) {
                  customerId = user.user.id;
                  return Container();
                })
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
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
