part of 'product_cubit.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {
  ProductInitial();
}

class FetchProduct extends ProductState {}

class ProductLoading extends ProductState {
  final List<Product> oldProducts;
  final bool isFirstFetch;
  ProductLoading({required this.oldProducts, this.isFirstFetch = false});
}

class ProductLoaded extends ProductState {
  List<Product> product;
  ProductLoaded({required this.product});
}
