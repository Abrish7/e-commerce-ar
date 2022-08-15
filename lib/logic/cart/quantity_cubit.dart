import 'package:ecommerce_v3/data/provider/cart_api.dart';
import 'package:ecommerce_v3/data/repository/cart_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// part 'quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityState(quantity: 1, productId: ""));

  void setQuantity({required quantity, required productId}) {
    emit(state.copyWith(quantity: quantity, productId: productId));
  }

  void increaseQuantityState({required quantity, required productId}) async {
    emit(state.copyWith(quantity: quantity + 1, productId: productId));
    return;
  }

  void decreaseQuantityState({required quantity, required productId}) async {
    emit(state.copyWith(quantity: quantity - 1, productId: productId));
    return;
  }

  void resetQuantityState() => emit(QuantityState(quantity: 1, productId: ""));
}

class QuantityState extends Equatable {
  final int quantity;
  final String productId;
  QuantityState({required this.quantity, required this.productId});

  QuantityState copyWith({int? quantity, String? productId}) {
    return QuantityState(
        quantity: quantity ?? this.quantity,
        productId: productId ?? this.productId);
  }

  @override
  List<Object?> get props => [quantity, productId];
}
