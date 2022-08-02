import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/screen.payment/payment_top_app_bar.dart';
import '../widgets/screen.payment/payment_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: PaymentTopAppBar(), preferredSize: Size.fromHeight(65)),
      body: PaymentWidget(),
    );
  }
}
