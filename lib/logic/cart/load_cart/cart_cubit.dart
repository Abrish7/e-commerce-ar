import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/model/new_cart.dart';
import 'package:ecommerce_v3/data/repository/cart_repo.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepository) : super(CartInitial());
  CartRepository cartRepository;

  void addToCart(
      {required customerId, required productId, required quantity}) async {
    print("ADD TO CART TRIGGERED");
    await cartRepository
        .addToCart(
            customerId: customerId, productId: productId, quantity: quantity)
        .then((cart) {
      print("EMITTING CART :" + cart.message);
      // getCustomerCart(customerId: cart.cart.customerId);
    });
  }

  void getCustomerCart({required customerId}) async {
    print("GET CUSTOMER CART LOADED :) ");
    await cartRepository.fetchCustomerCart(customerId: customerId).then((cart) {
      print("EMITTING CART :" + cart.message);
      emit(CartLoaded(cart: cart));
      // }
    });
  }
}
