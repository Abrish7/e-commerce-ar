import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: PaymentWidget(),
      ),
    );
  }
}
