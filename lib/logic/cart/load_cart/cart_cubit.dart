import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/model/product_in_cart.dart';
import 'package:ecommerce_v3/data/repository/cart_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepository) : super(CartInitial());
  CartRepository cartRepository;

  void addToCart(
      {required customerId, required productId, required quantity}) async {
    print("ADD TO CART TRIGGERED");
    // print(' Product Cart...Loaded... ');
    await cartRepository
        .fetchProductInCart(
            customerId: customerId, productId: productId, quantity: quantity)
        .then((cart) {
      // if (cart is ProductInCart) {
      print("EMITTING CART :" + cart.message);
      emit(CartLoaded(cart: cart));
      // }
    });
  }

  void addCartQuantityUpdate(
      {required customerId, required productId, required quantity}) async {
    print("CART QUANTITY ADDED");
    await cartRepository
        .fetchProductInCart(
            customerId: customerId, productId: productId, quantity: quantity)
        .then((cart) {
      print("EMITTING CART QUANTITY:" + cart.message);
      emit(CartLoaded(cart: cart));
      // }
    });
  }
}
