import 'package:ecommerce_v3/logic/order/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.sell_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      ' ' +
                          state.order[index].products.length.toString() +
                          ' items',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'tracking number',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      state.order[index].trackingNumber.toString(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'payment reference',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      state.order[index].paymentReference.toString(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'date',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      state.order[index].createdAt.toString(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                //
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'status',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 10,
                    ),
                    Text(
                      ' ' + state.order[index].orderStatus.toString(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.grey[300],
                  height: 1,
                  width: MediaQuery.of(context).size.width * .9,
                  child: Container(),
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  _productImage(image) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 2.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Image.network(image),
      ),
    );
  }
}
