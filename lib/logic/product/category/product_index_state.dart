part of 'product_index_cubit.dart';

abstract class ProductIndexState extends Equatable {
  const ProductIndexState();

  @override
  List<Object> get props => [];
}

class ProductIndexInitial extends ProductIndexState {}

class ProductCategoryIndex2 extends ProductIndexState {
  final int index;
  const ProductCategoryIndex2({required this.index});
}
