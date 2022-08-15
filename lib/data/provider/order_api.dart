import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_v3/config.dart';
import 'package:http/http.dart' as http;

import '../model/order_model.dart';

class OrderApi {
  Future<List<dynamic>> getOrder({required customerId}) async {
    try {
      final response =
          await http.post(Uri.parse(Configurations().getOrderUrl()),
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json',
              },
              body: jsonEncode(<String, String>{
                'customerId': customerId,
              }));
      print(jsonDecode(response.body)['message']);
      return jsonDecode(response.body)['order'] as List<dynamic>;
    } catch (e) {
      print('nothing (:)');
      return [];
    }
  }
}
