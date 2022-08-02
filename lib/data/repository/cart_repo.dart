import 'dart:convert';

import 'package:ecommerce_v3/data/model/new_cart.dart';
import 'package:ecommerce_v3/data/model/updated_cart.dart';
import 'package:ecommerce_v3/data/provider/cart_api.dart';

class CartRepository {
  final CartApi cartApi;
  CartRepository({required this.cartApi});

  Future<UpdatedCart> addToCart(
      {required customerId, required productId, required quantity}) async {
    final cart = await cartApi.setProductInCart(
        customerId: customerId, productId: productId, quantity: quantity);
    return UpdatedCart.fromJson(cart);
  }

  Future<NewCart> fetchCustomerCart({required customerId}) async {
    final cart = await cartApi.getCustomerCart(customerId: customerId);
    print(cart.toString());
    return NewCart.fromJson(cart);
  }

  Future<String> updateCartQuantity(
      {required customerId, required productId, required quantity}) async {
    final cart = await cartApi.updateCartQuantity(
        customerId: customerId, productId: productId, quantity: quantity);
    print(cart.toString());
    return cart;
  }
}
