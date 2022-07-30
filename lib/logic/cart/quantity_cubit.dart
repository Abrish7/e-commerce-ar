import 'package:flutter_bloc/flutter_bloc.dart';

// part 'quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityState(quantity: 1, size: 1));

  void increaseQuantityState({required quantity, required size}) {
    if (state.quantity == state.size) {
      print('quantity size stop');
      emit(QuantityState(quantity: quantity, size: size));
    } else {
      print('quantity size --');
      emit(QuantityState(quantity: quantity + 1, size: size));
    }
  }

  void decreaseQuantityState({required quantity, required size}) {
    if (state.quantity == 1) {
      print('quantity size stop');
      emit(QuantityState(quantity: quantity, size: size));
    } else {
      print('quantity size --');
      emit(QuantityState(quantity: quantity - 1, size: size));
    }
  }

  void resetQuantityState() => emit(QuantityState(quantity: 1, size: 0));
}

class QuantityState {
  final int quantity;
  final int size;
  QuantityState({required this.quantity, required this.size});
}
