part of 'product_filter_by_category_cubit.dart';

abstract class ProductFilterByCategoryState extends Equatable {
  const ProductFilterByCategoryState();
  @override
  List<Object> get props => [];
}

class ProductFilterByCategoryInitial extends ProductFilterByCategoryState {}

class ProductFilterByCategoryLoading extends ProductFilterByCategoryState {
  final List<Product> oldProducts;
  final bool isFirstFetch;
  ProductFilterByCategoryLoading(
      {required this.oldProducts, required this.isFirstFetch});
}

// ignore: must_be_immutable
class ProductFilterByCategoryLoaded extends ProductFilterByCategoryState {
  List<Product> product;
  ProductFilterByCategoryLoaded({required this.product});
}
