part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  ProductInitial();
}

class FetchProduct extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  List<Product> product;
  ProductLoaded({required this.product});
}
