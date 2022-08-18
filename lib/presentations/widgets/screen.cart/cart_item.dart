import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_v3/logic/cart/load_cart/cart_cubit.dart';
import 'package:ecommerce_v3/logic/cart/quantity_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.cart/cart_quantity_counter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../logic/auth/cubit/user_cubit.dart';
import '../../../logic/cart/total_cart_cubit.dart';

class CartItem extends StatefulWidget {
  CartItem({Key? key, required this.index, required this.productId})
      : super(key: key);
  final index;
  final String productId;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int activeIndex = 0;
  late int imageSize = 0;
  late String customerId = "";
  late double total = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        total = 00;
        // if (state is CartLoaded) {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: CarouselSlider.builder(
                  itemCount: state.cart[this.widget.index].image.length,
                  itemBuilder: (context, index, relIndex) {
                    final urlImage = state.cart[this.widget.index].image[index];
                    return _buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      height: 250,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 10),
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index))),
            ),
            SizedBox(
              height: 10,
            ),
            _buildImageIndicator(),
            SizedBox(
              height: 10,
            ),
            // product name
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  state.cart[this.widget.index].name,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                )),
            // Product description
            // Container(
            //     padding: EdgeInsets.only(left: 15, top: 5),
            //     child: Text(
            //       state.cart[this.widget.index].description,
            //       style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
            //     )),
            // SizedBox(
            //   height: 10,
            // ),
            // pr
            // product quantity
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Quantity ",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                      textAlign: TextAlign.left,
                    )),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      state.cart[this.widget.index].quantity.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                      textAlign: TextAlign.left,
                    )),
              ],
            ),

            // Product Price
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Price ",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                      textAlign: TextAlign.left,
                    )),
                BlocBuilder<QuantityCubit, QuantityState>(
                  buildWhen: (previous, current) =>
                      state.cart[this.widget.index].id == current.productId,
                  builder: (context, quantityState) {
                    return Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          state.cart[this.widget.index].price.toString() +
                              " X " +
                              state.cart[this.widget.index].quantity.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 20),
                          textAlign: TextAlign.left,
                        ));
                  },
                ),
              ],
            ),
            BlocBuilder<UserCubit, UserState>(builder: (context, userState) {
              customerId = userState.user.id.toString();
              return Container();
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 20, right: 10, bottom: 20),
                    child: IconButton(
                        onPressed: () async {
                          await BlocProvider.of<CartCubit>(context)
                            ..removeCustomerCartItem(
                                customerId: customerId,
                                productId: this.widget.productId);
                          print('cart removed...');
                          BlocProvider.of<TotalCartCubit>(context)
                              .getTotalPrice(customerId: customerId);
                        },
                        icon: Icon(
                          Icons.cancel,
                          size: 35,
                          color: Colors.red[300],
                        ))),
                Container(
                    padding: EdgeInsets.only(top: 20, right: 10, bottom: 20),
                    child: _productQuantity(
                        this.widget.index,
                        state.cart[this.widget.index].id,
                        state.cart[this.widget.index].quantity))
              ],
            ),
          ],
        );
        // }
        // return CircularProgressIndicator();
      },
    );
  }

  _buildImage(String image, int index) {
    return Container(
      // width: 250,
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Image.network(image),
    );
  }

  Widget _buildImageIndicator() => Center(
        child: AnimatedSmoothIndicator(
          activeIndex: this.activeIndex,
          curve: Curves.easeInOut,
          count: imageSize,
          effect: JumpingDotEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Color.fromARGB(255, 252, 113, 103),
              dotColor: Colors.black12),
        ),
      );

  Widget _productDetails() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _productName('Name nike'),
          _productPrice('Price \$100.00'),
        ],
      ),
    );
  }

  Widget _productName(name) {
    return Container(
      child: Text(
        name,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }

  Widget _productPrice(price) {
    return Container(
      child: Text(
        price,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),
      ),
    );
  }

  Widget _productQuantity(index, productId, quantity) {
    return CartQuantityCounter(
      index: index,
      productId: productId,
      quantity: quantity,
    );
  }
}
