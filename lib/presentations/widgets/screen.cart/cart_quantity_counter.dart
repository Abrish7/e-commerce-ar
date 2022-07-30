import 'package:flutter/material.dart';

class CartQuantityCounter extends StatelessWidget {
  const CartQuantityCounter(
      {Key? key, required this.index, required this.cartId})
      : super(key: key);
  final int index;
  final String cartId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
              // BlocProvider.of<QuantityCubit>(context).decreaseQuantityState();
              print('counter -- : ... ' + index.toString());
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
            onPressed: () {
              print('counter ++ : ... ' + index.toString());
            },
            child: Icon(
              icon,
              color: Colors.black,
            )));
  }
}
