import 'package:ecommerce_v3/data/model/cart_model.dart';
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

  Future<List<CartModel>> fetchCustomerCart({required customerId}) async {
    final products = await cartApi.getCustomerCart(customerId: customerId);
    // print(products.toString());
    return products.map((e) => CartModel.fromJson(e)).toList();
  }

  Future<bool> removeCustomerCartItem(
      {required customerId, required productId}) async {
    final cart = await cartApi.removeCustomerCartItem(
        customerId: customerId, productId: productId);
    return true;
  }

  Future<String> updateCartQuantity(
      {required customerId, required productId, required quantity}) async {
    final cart = await cartApi.updateCartQuantity(
        customerId: customerId, productId: productId, quantity: quantity);
    print(cart.toString());
    return cart;
  }

  // removeCustomerCartItem
}
