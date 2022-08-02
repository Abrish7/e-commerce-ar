import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/model/product_model.dart';
import 'package:ecommerce_v3/data/repository/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.repository) : super(ProductInitial());

  int page = 0;
  final ProductRepo repository;

  void loadProduct() {
    print('loading product...');
    if (state is ProductLoading) return;
    final currentState = state;
    var oldProduct = <Product>[];
    if (currentState is ProductLoaded) {
      oldProduct = currentState.product;
    }
    emit(ProductLoading(oldProducts: oldProduct, isFirstFetch: page == 1));

    repository.fetchProduct(page: page).then((newProduct) {
      // page++;
      final products = (state as ProductLoading).oldProducts;
      products.addAll(newProduct);
      emit(ProductLoaded(product: products));
    });
  }
}
