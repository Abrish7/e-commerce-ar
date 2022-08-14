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

  Future<List<dynamic>> getCustomerCart({required customerId}) async {
    print("from API: " + customerId);
    try {
      final response = await http.get(
        Uri.parse(Configurations().getCustomerCartURL() + "/" + customerId),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      final data = (jsonDecode(response.body)['cart'][0]['products'] as List);
      // print('new products' + data[0].toString());
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> updateCartQuantity(
      {required customerId, required productId, required quantity}) async {
    print("customer: " +
        customerId +
        " product: " +
        productId +
        " quantity: " +
        quantity.toString());
    try {
      final response = await http.post(
          Uri.parse(Configurations().getCartQuantityUpdateURL()),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'customerId': customerId,
            'productId': productId,
            'newQuantity': quantity
          }));
      final data = (jsonDecode(response.body)['message']);
      return data;
    } catch (e) {
      print("Error");
      return [];
    }
  }

  Future<dynamic> removeCustomerCartItem(
      {required customerId, required productId}) async {
    try {
      final response = await http.post(
          Uri.parse(Configurations().getCustomerCartRemoveURL()),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'customerId': customerId,
            'products': productId
          }));
      final data = (jsonDecode(response.body));
      return data;
    } catch (e) {
      return [];
    }
  }
}
