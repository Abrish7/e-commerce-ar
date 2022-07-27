import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/repository/product_category_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/product_category.dart';
import '../../../data/repository/product_sub_category_repo.dart';

part 'product_category_state.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  ProductCategoryCubit() : super(ProductCategoryInitial());
  ProductCategoryRepo repo = ProductCategoryRepo();
  ProductSubCategoryRepo subCategoryRepo = ProductSubCategoryRepo();

  void setProductCategoryLoadedState() async {
    // final products =
    await repo.getProductCategory(emit);
  }

  // void setProductSubCategoryLoadedState(category) async {
  //   // final products =
  //   await subCategoryRepo.getProductSubCategory(emit, category);
  // }

  void setCurrentCategoryIndexState(index) {
    setProductCategoryLoadedState();
    emit(ProductCategoryIndex(index: index));
  }
}
