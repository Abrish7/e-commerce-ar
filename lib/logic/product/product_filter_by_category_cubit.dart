import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/product_model.dart';
import '../../data/repository/product_filter_by_category_repo.dart';

part 'product_filter_by_category_state.dart';

class ProductFilterByCategoryCubit extends Cubit<ProductFilterByCategoryState> {
  ProductFilterByCategoryCubit(this.repository)
      : super(ProductFilterByCategoryInitial());

  int page = 1;

  final ProductFilterByCategoryRepo repository;

  void loadProduct({required String category, required String subCategory}) {
    print('loading product...');
    print('category ' + category);
    print('sub category ' + subCategory);

    emit(ProductFilterByCategoryLoading(
        oldProducts: [], isFirstFetch: page == 1));

    repository
        .fetchProduct(page: page, category: category, subCategory: subCategory)
        .then((newProduct) {
      emit(ProductFilterByCategoryLoaded(product: newProduct));
    });
  }
}
