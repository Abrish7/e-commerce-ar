import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/model/tag_product.dart';
import 'package:ecommerce_v3/data/repository/tag_product_repo.dart';
import 'package:equatable/equatable.dart';

part 'tag_product_state.dart';

class TagProductCubit extends Cubit<TagProductState> {
  TagProductCubit() : super(TagProductInitial());

  getTagProduct({required tagName}) {
    emit(TagProductLoading());
    TagProductRepository().getTagProduct(emit, tagName);
  }
}
