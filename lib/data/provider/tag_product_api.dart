import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_v3/config.dart';
import 'package:http/http.dart' as http;

class TagProductApi {
  Future<dynamic> getTagProduct(tagName) async {
    try {
      final response = await http.get(
        Uri.parse(Configurations().getTagProductUrl() + "/" + tagName),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      print('tag product from api: ' + response.body.toString());
      if ((response.body).isNotEmpty) {
        print('what is happening 00 ... ' + response.body.toString());
        return jsonDecode(response.body);
      }

      return '';
    } catch (e) {
      print('what is happening...');
      return '';
    }
  }
}
