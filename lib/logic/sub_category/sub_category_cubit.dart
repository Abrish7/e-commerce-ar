import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/product_sub_category.dart';
import '../../../data/repository/product_sub_category_repo.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit() : super(ProductSubCategoryInitial());
  ProductSubCategoryRepo subCategoryRepo = ProductSubCategoryRepo();

  void setProductSubCategoryLoaded({subCategory}) async {
    emit(ProductSubCategoryLoading());
    await subCategoryRepo.getProductSubCategory(emit, subCategory);
  }
}

abstract class SubCategoryState extends Equatable {}

class ProductSubCategoryInitial extends SubCategoryState {
  @override
  List<Object?> get props => [];
}

class ProductSubCategoryLoaded extends SubCategoryState {
  final List<ProductSubCategory> subCategory;
  ProductSubCategoryLoaded({required this.subCategory});
  @override
  List<Object?> get props => [subCategory];
}

class ProductSubCategoryLoading extends SubCategoryState {
  ProductSubCategoryLoading();

  @override
  List<Object?> get props => [];
}
