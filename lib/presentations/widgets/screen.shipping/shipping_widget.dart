import 'package:ecommerce_v3/presentations/widgets/screen.shipping/shipping_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShippingWidget extends StatelessWidget {
  const ShippingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ShippingForm()],
    );
  }
}
