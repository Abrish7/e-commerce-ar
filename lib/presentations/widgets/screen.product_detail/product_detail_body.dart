import 'package:ecommerce_v3/presentations/widgets/screen.product_detail/product_title_with_image.dart';
import 'package:flutter/material.dart';

import 'product_add_to_cart_ar_btn.dart';
import 'product_color_and_size.dart';
import 'product_counter_with_fav_btn.dart';
import 'product_description.dart';

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody(this.index, this.scaffoldKey);
  final int index;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                ProductTitleWithImage(index: index),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12, left: 15, right: 15),
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: [
                      ProductColorAndSize(index: index),
                      ProductDescription(index: index),
                      CounterWithFavBtn(
                        index: index,
                        // scaffoldKey: scaffoldKey,
                      ),
                      // ProductAddToCartAndARBtn(
                      //   index: index,
                      //   scaffoldKey: scaffoldKey,
                      // )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
