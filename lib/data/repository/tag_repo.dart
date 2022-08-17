import 'dart:convert';

import 'package:ecommerce_v3/data/model/tag_model.dart';
import 'package:ecommerce_v3/logic/tag/tag_cubit.dart';

import '../provider/tag_api.dart';

class TagRepository {
  TagApi _tagApi = TagApi();

  getTag(emit) {
    try {
      List<TagModel> products = [];
      _tagApi.getTags().then((value) async {
        if (value.statusCode == 200) {
          final data = jsonDecode(value.body)['tags'] as List;
          products =
              await data.map((e) => TagModel.fromJson({'name': e})).toList();
          print('phase 1 test: ' + products[0].tagName);
          emit(TagLoaded(tags: products));
        }
        print("getting product products..." + products.length.toString());
      });
      return products;
    } catch (e) {
      throw "Error occur";
    }
  }
}
