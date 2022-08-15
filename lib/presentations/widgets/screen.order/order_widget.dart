import 'package:ecommerce_v3/logic/order/order_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.order/oredr_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoaded) {
            print('builder works fine ' + state.order.length.toString());
            return ListView.builder(
                itemCount: state.order.length,
                itemBuilder: (context, index) {
                  return Container(
                    // padding: const EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.grey[100]),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(1)),
                        // color: Colors.grey[100],
                        // elevation: 0.5,
                        onPressed: () {},
                        child: OrderItem(index: index)),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
