import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/screen.payment_type/payment_type_top_app_bar.dart';
import '../widgets/screen.payment_type/payment_type_widget.dart';

class PaymentTypeScreen extends StatelessWidget {
  const PaymentTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: PaymentTypeTopAppBar(), preferredSize: Size.fromHeight(65)),
      body: PaymentTypeWidget(),
    );
  }
}
