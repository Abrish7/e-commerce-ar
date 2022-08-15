import 'package:ecommerce_v3/presentations/widgets/screen.shipping/shipping_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/screen.shipping/shipping_app_bar.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: ShippingAppBar(), preferredSize: Size.fromHeight(65)),
      body: ShippingWidget(),
    );
  }
}
