import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'product_category_cubit.dart';

part 'product_index_state.dart';

class ProductIndexCubit extends Cubit<ProductIndexState> {
  ProductIndexCubit() : super(ProductIndexInitial());

  void setCurrentCategoryIndexState2(index) {
    emitCategory();
  }

  void emitCategory() {
    ProductCategoryCubit().setProductCategoryLoadedState();
  }
}
