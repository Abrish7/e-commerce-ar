import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/model/cart_model.dart';
import 'package:ecommerce_v3/data/repository/cart_repo.dart';
import 'package:equatable/equatable.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepository) : super(CartState(cart: []));
  CartRepository cartRepository;

  void addToCart(
      {required customerId, required productId, required quantity}) async {
    print("ADD TO CART TRIGGERED");
    await cartRepository
        .addToCart(
            customerId: customerId, productId: productId, quantity: quantity)
        .then((cart) {
      print("EMITTING CART :" + cart.message);
      getCustomerCart(customerId: cart.cart.customerId);
    });
  }

  void getCustomerCart({required customerId}) async {
    print("GET CUSTOMER CART LOADED :) ");
    await cartRepository.fetchCustomerCart(customerId: customerId).then((cart) {
      print("EMITTING CART : " + cart.length.toString());
      emit(state.copyWith(cart: cart));
      // }
    });
  }

  void updateCart({required productId, required quantity}) {
    int index = state.cart.indexWhere((element) => element.id == productId);

    List<CartModel> carts = List.from(state.cart)
      ..removeWhere((element) => element.id == productId);

    carts.insert(
        index,
        CartModel(
            id: productId,
            name: state.cart[index].name,
            property: state.cart[index].property,
            quantity: quantity,
            description: state.cart[index].description,
            image: state.cart[index].image,
            tag: state.cart[index].tag,
            price: state.cart[index].price));

    emit(state.copyWith(cart: carts));
  }
}

class CartState extends Equatable {
  final List<CartModel> cart;
  const CartState({required this.cart});
  CartState copyWith({List<CartModel>? cart}) {
    return CartState(cart: cart ?? this.cart);
  }

  @override
  List<Object> get props => [cart];
}
