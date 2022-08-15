import 'package:ecommerce_v3/data/model/favorite_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalCartCubit extends Cubit<TotalCartState> {
  TotalCartCubit() : super(TotalCartState(total: "0"));
  void setTotalProduct(String total) {
    emit((TotalCartState(total: total)));
  }
}

class TotalCartState {
  String total;
  TotalCartState({required this.total});
}
