part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartAdded extends CartEvent {
  CartModel cart;
  CartAdded({required this.cart});
}

class CartRemoved extends CartEvent {}

class CartUpdated extends CartEvent {}
