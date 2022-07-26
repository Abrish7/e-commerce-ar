import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/model/product_model.dart';
import 'package:ecommerce_v3/data/provider/product_api.dart';
import 'package:ecommerce_v3/data/repository/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  ProductRepo repository = ProductRepo();

  void setProductLoaded() async {
    List<Product> data = await ProductApi().getProduct();
    // Timer(const Duration(milliseconds: 3000), () {
    // });
    if (data.isNotEmpty) {
      emit(ProductLoaded(product: repository.getProduct()));
    }
    if (data.isEmpty) {
      emit(ProductLoading());
    }
  }
}
