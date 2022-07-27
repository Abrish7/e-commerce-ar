import 'package:ecommerce_v3/logic/product/cart/quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartQuantityCounter extends StatelessWidget {
  const CartQuantityCounter({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quantity',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              // ProductFavoriteButton(index: index, isLiked: false)
            ],
          ),
          Row(children: <Widget>[
            builtOutlinedButtonRemove(
                icon: Icons.remove, size: 1, context: context),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  1.toString(),
                  style: Theme.of(context).textTheme.headline6,
                )),
            builtOutlinedButtonAdd(icon: Icons.add, size: 1, context: context),
          ]),
        ],
      ),
    );
  }

  SizedBox builtOutlinedButtonRemove(
      {required IconData icon,
      required BuildContext context,
      required int size}) {
    return SizedBox(
        width: 55,
        height: 32,
        child: OutlinedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              BlocProvider.of<QuantityCubit>(context).decreaseQuantityState();
            },
            child: Icon(
              icon,
              color: Colors.black,
            )));
  }

  SizedBox builtOutlinedButtonAdd(
      {required IconData icon,
      required BuildContext context,
      required int size}) {
    return SizedBox(
        width: 55,
        height: 32,
        child: OutlinedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {},
            child: Icon(
              icon,
              color: Colors.black,
            )));
  }
}
