import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/order/order_cubit.dart';
import '../widgets/screen.order/order_app_bar.dart';
import '../widgets/screen.order/order_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrderCubit>(context)..getOrder();
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: OrderAppBar(), preferredSize: Size.fromHeight(65)),
      body: OrderWidget(),
    );
  }
}
