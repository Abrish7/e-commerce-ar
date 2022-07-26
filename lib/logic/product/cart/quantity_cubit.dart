import 'package:flutter_bloc/flutter_bloc.dart';

// part 'quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityState(quantity: 1, isInCart: false));

  void increaseQuantityState({int inCartSize = 0, bool isInCart = false}) {
    if (isInCart) {
      print("it is indeed in cart++");
      emit(QuantityState(quantity: state.quantity + 1, isInCart: isInCart));
    } else {
      emit(QuantityState(quantity: state.quantity + 1, isInCart: isInCart));
    }
  }

  void decreaseQuantityState({int inCartSize = 0, bool isInCart = false}) {
    if (state.quantity <= 1 && inCartSize <= 1) {
      emit(QuantityState(quantity: state.quantity, isInCart: isInCart));
    } else {
      if (isInCart) {
        print("it is indeed in cart--");
        emit(QuantityState(quantity: inCartSize - 1, isInCart: isInCart));
      } else {
        emit(QuantityState(quantity: state.quantity - 1, isInCart: isInCart));
      }
    }
  }

  void resetQuantityState() =>
      emit(QuantityState(quantity: 1, isInCart: false));
}

class QuantityState {
  final int quantity;
  final bool isInCart;
  QuantityState({required this.quantity, required this.isInCart});
}
