import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/cart_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cart: {0: Cart(productId: 0, quantity: 0)}));

  void setCartState(Cart cart) {
    Map<int, Cart> temp = state.cart;
    if (state.cart.containsKey(cart.productId)) {
      temp.update(cart.productId, (value) => cart);
    } else {
      temp.putIfAbsent(cart.productId, () => cart);
      emit(CartState(cart: temp));
    }
  }
}

class CartState {
  Map<int, Cart> cart;
  CartState({required this.cart});
}
