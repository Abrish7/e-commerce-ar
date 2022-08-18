import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_v3/data/model/favorite_model.dart';
import 'package:ecommerce_v3/data/provider/cart_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';

class TotalCartCubit extends Cubit<TotalCartState> {
  TotalCartCubit() : super(TotalCartState(total: "0"));
  void setTotalProduct(String total) {
    emit((TotalCartState(total: total)));
  }

  void getTotalPrice({customerId}) async {
    final response = await http.get(
      Uri.parse(Configurations().getCustomerCartURL() + "/" + customerId),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    print('price: ' + (jsonDecode(response.body)['subTotal'].toString()));
    emit(TotalCartState(
        total: (jsonDecode(response.body)['subTotal'].toString())));
  }
}

class TotalCartState {
  String total;
  TotalCartState({required this.total});
}
