import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/model/cart_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartEvent>((event, emit) {
      if (event is CartAdded) {
        emit(_mapCartLoadingState(event));
      }
    });
  }

  _mapCartLoadingState(CartAdded event) {
    // state as CartLoaded;
    // return CartLoaded(cart: state);
  }
}
