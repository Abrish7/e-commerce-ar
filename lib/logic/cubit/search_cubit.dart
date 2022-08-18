import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/model/search_model.dart';
import 'package:ecommerce_v3/data/repository/search_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/search_product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void getProduct({query = ''}) async {
    print('val: ' + query);
    emit(SearchInitial());
    await SearchRepository().searchProducts(query, emit);
  }

  // void getPro() async {
  //   List<SearchProductModel> l = await SearchRepository().searchProducts('sho');
  //   print('length: ' + l.length.toString());
  // }
}
