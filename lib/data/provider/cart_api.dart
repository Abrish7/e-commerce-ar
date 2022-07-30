import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_v3/config.dart';
import 'package:http/http.dart' as http;

class CartApi {
  // final String getURL = "http://localhost:3000/api/shopping-cart/add-to-cart";

  Future<dynamic> setProductInCart(
      {required customerId, required productId, required quantity}) async {
    try {
      final response = await http.post(Uri.parse(Configurations().getCartURL()),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'customerId': customerId,
            'products': [
              {"productId": productId, "quantity": quantity}
            ],
          }));
      final data = (jsonDecode(response.body));
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> updateCartQuantity(
      {required customerId, required productId, required quantity}) async {
    try {
      final response = await http.post(Uri.parse(Configurations().getCartURL()),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'customerId': customerId,
            'products': [
              {"productId": productId, "quantity": quantity}
            ],
          }));
      final data = (jsonDecode(response.body));
      return data;
    } catch (e) {
      return [];
    }
  }
}
