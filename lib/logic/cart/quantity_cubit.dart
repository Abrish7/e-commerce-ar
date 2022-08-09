import 'package:ecommerce_v3/data/provider/cart_api.dart';
import 'package:ecommerce_v3/data/repository/cart_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// part 'quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit()
      : super(QuantityState(index: 0, quantity: 1, size: 1, productId: ""));

  void setQuantity(
      {required index,
      required customerId,
      required quantity,
      required size,
      required productId}) {
    emit(state.copyWith(
        index: index, quantity: quantity, size: size, productId: productId));
  }

  void increaseQuantityState(
      {required index,
      required customerId,
      required quantity,
      required size,
      required productId}) async {
    emit(state.copyWith(
        index: index,
        quantity: quantity + 1,
        size: size,
        productId: productId));
    return;
    if (state.quantity == state.size) {
      print('quantity size stop');
      emit(state.copyWith(
          index: index, quantity: quantity, size: size, productId: productId));
    } else {
      await CartRepository(cartApi: CartApi())
          .updateCartQuantity(
              customerId: customerId,
              productId: productId,
              quantity: quantity + 1)
          .then((value) {
        // print("EMITTING CART QUANTITY:" + quantity.quantity.toString());
        emit(state.copyWith(
            index: index,
            quantity: quantity + 1,
            size: size,
            productId: productId));
        // }
      });
    }
  }

  void decreaseQuantityState(
      {required index,
      required customerId,
      required quantity,
      required size,
      required productId}) async {
    emit(state.copyWith(
        index: index,
        quantity: quantity - 1,
        size: size,
        productId: productId));
    return;
    if (state.quantity == 1) {
      print('quantity size stop');
      emit(state.copyWith(
          index: index, quantity: quantity, size: size, productId: productId));
    } else {
      await CartRepository(cartApi: CartApi())
          .updateCartQuantity(
              customerId: customerId,
              productId: productId,
              quantity: quantity - 1)
          .then((value) {
        // print("EMITTING CART QUANTITY:" + quantity.quantity);
        emit(state.copyWith(
            index: index,
            quantity: quantity - 1,
            size: size,
            productId: productId));
        // }
      });
    }
  }

  void resetQuantityState() =>
      emit(QuantityState(quantity: 1, size: 0, productId: "", index: 0));
}

class QuantityState extends Equatable {
  final int quantity;
  final int size;
  final String productId;
  final int index;
  QuantityState(
      {required this.index,
      required this.quantity,
      required this.size,
      required this.productId});

  QuantityState copyWith(
      {int? quantity, int? size, String? productId, int? index}) {
    return QuantityState(
        index: index ?? this.index,
        quantity: quantity ?? this.quantity,
        size: size ?? this.size,
        productId: productId ?? this.productId);
  }

  @override
  List<Object?> get props => [quantity, size, productId, index];
}
