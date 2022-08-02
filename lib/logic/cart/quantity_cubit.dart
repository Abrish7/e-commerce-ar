import 'package:ecommerce_v3/data/provider/cart_api.dart';
import 'package:ecommerce_v3/data/repository/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// part 'quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit()
      : super(QuantityState(
            isEdited: false, quantity: 1, size: 1, productId: ""));

  void setQuantity(
      {required isEdited,
      required customerId,
      required quantity,
      required size,
      required productId}) {
    emit(QuantityState(
        isEdited: isEdited,
        quantity: quantity,
        size: size,
        productId: productId));
  }

  void increaseQuantityState(
      {required isEdited,
      required customerId,
      required quantity,
      required size,
      required productId}) async {
    if (state.quantity == state.size) {
      print('quantity size stop');
      emit(QuantityState(
          isEdited: isEdited,
          quantity: quantity,
          size: size,
          productId: productId));
    } else {
      await CartRepository(cartApi: CartApi())
          .updateCartQuantity(
              customerId: customerId,
              productId: productId,
              quantity: quantity + 1)
          .then((value) {
        // print("EMITTING CART QUANTITY:" + quantity.quantity.toString());
        emit(QuantityState(
            isEdited: isEdited,
            quantity: quantity + 1,
            size: size,
            productId: productId));
        // }
      });
    }
  }

  void decreaseQuantityState(
      {required isEdited,
      required customerId,
      required quantity,
      required size,
      required productId}) async {
    if (state.quantity == 1) {
      print('quantity size stop');
      emit(QuantityState(
          isEdited: isEdited,
          quantity: quantity,
          size: size,
          productId: productId));
    } else {
      await CartRepository(cartApi: CartApi())
          .updateCartQuantity(
              customerId: customerId,
              productId: productId,
              quantity: quantity - 1)
          .then((value) {
        // print("EMITTING CART QUANTITY:" + quantity.quantity);
        emit(QuantityState(
            isEdited: isEdited,
            quantity: quantity - 1,
            size: size,
            productId: productId));
        // }
      });
    }
  }

  void resetQuantityState() =>
      emit(QuantityState(quantity: 1, size: 0, productId: "", isEdited: false));
}

class QuantityState {
  final int quantity;
  final int size;
  final String productId;
  final bool isEdited;
  QuantityState(
      {required this.isEdited,
      required this.quantity,
      required this.size,
      required this.productId});
}
