part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

// ignore: must_be_immutable
class CartLoaded extends CartState {
  ProductInCart cart;
  CartLoaded({required this.cart});
}
