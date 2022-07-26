import 'package:ecommerce_v3/data/model/favorite_model.dart';
import 'package:ecommerce_v3/logic/product/cart/favorite_cubit.dart';
import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFavoriteButton extends StatelessWidget {
  final bool isLiked;
  final int index;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProductFavoriteButton(
      {Key? key,
      required this.index,
      required this.isLiked,
      required this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.pink),
            color: const Color.fromARGB(255, 203, 203, 203),
            shape: BoxShape.circle),
        child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, productState) {
          productState as ProductLoaded;
          return BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, favState) {
            bool isLiked = false;
            if (favState.fav.containsKey(productState.product[index].id)) {
              isLiked = true;
            }
            return GestureDetector(
                onTap: (() {
                  if (isLiked) {
                    BlocProvider.of<FavoriteCubit>(context)
                        .removeFavoriteProduct(productState.product[index].id);
                    buildSnackBar(productState, " removed from favorite list.",
                        Colors.red);
                  } else {
                    buildSnackBar(
                        productState, " add to favorite list.", Colors.blue);
                    BlocProvider.of<FavoriteCubit>(context).addFavoriteProduct(
                        Favorite(
                            isFav: isLiked,
                            productId: productState.product[index].id));
                  }
                }),
                child: Icon(
                  Icons.favorite,
                  color: isLiked
                      ? const Color.fromARGB(255, 255, 6, 39)
                      : Colors.white,
                ));
          });
        }));
  }

  void buildSnackBar(ProductLoaded productState, String append, Color color) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000),
        backgroundColor: color,
        content: Text(
          "product ${productState.product[index].name} $append",
          style: const TextStyle(color: Colors.white),
        )));
  }
}
