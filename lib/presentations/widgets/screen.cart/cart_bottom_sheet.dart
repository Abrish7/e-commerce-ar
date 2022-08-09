import 'package:ecommerce_v3/logic/cart/load_cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 0,
            spreadRadius: 0.5,
            color: Colors.black12,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                // if (state is CartLoaded) {
                // state.cart.subTotal.toStringAsFixed(2)
                return Text("00.00",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w300));
              }
                  // return CircularProgressIndicator();
                  // },
                  )
            ],
          ),
          RaisedButton(
            // style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(Colors)),
            color: Colors.black,
            elevation: 0,
            onPressed: () {
              Navigator.pushNamed(context, '/payment_type');
            },
            child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 15),
                width: 200,
                child: Text(
                  'order',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
