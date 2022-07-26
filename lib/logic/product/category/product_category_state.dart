part of 'product_category_cubit.dart';

abstract class ProductCategoryState extends Equatable {
  const ProductCategoryState();

  @override
  List<Object> get props => [];
}

class ProductCategoryLoading extends ProductCategoryState {
  ProductCategoryLoading();
}

class ProductCategoryInitial extends ProductCategoryState {}

class ProductCategoryLoaded extends ProductCategoryState {
  final List<ProductCategory> category;
  const ProductCategoryLoaded({required this.category});
}

// class ProductSubCategoryLoaded extends ProductCategoryState {
//   final List<ProductSubCategory> subCategory;
//   const ProductSubCategoryLoaded({required this.subCategory});
// }

class ProductCategoryIndex extends ProductCategoryState {
  final int index;
  const ProductCategoryIndex({required this.index});
}
