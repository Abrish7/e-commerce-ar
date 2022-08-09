import 'package:ecommerce_v3/data/model/cart_model.dart';
import 'package:ecommerce_v3/logic/cart/quantity_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit(item) : super(CartItemState(item: item));

  void mapCartItem(
      {required quantity,
      required id,
      required name,
      required description,
      required image,
      required tag,
      required price,
      required property}) {
    print('emitting... from Item cubit');
    emit(CartItemState(
        item: CartModel(
            id: id,
            name: name,
            property: property,
            quantity: quantity,
            description: description,
            image: image,
            tag: tag,
            price: price)));
  }
}

// ignore: must_be_immutable
class CartItemState extends Equatable {
  CartModel item;
  CartItemState({required this.item});
  @override
  List<Object?> get props => [item];
}
