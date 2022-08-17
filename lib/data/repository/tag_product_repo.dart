import 'dart:convert';

import 'package:ecommerce_v3/data/model/tag_product.dart';
import 'package:ecommerce_v3/data/provider/tag_product_api.dart';

import '../../logic/tag/tag_product_cubit.dart';

class TagProductRepository {
  TagProductApi _productApi = TagProductApi();
  getTagProduct(emit, tagName) {
    try {
      List<TagProduct> tags = [];
      _productApi.getTagProduct(tagName).then((value) async {
        print("getting product by tag ..." + tags.length.toString());

        // if (value.statusCode == 200) {
        final data = (value)['product'] as List;
        tags = await data.map((e) => TagProduct.fromJson(e)).toList();
        emit(TagProductLoaded(product: tags));
        // }

        print("getting product by tag ..." + tags.length.toString());
      });
      return tags;
    } catch (e) {
      throw "Error occur";
    }
  }
}
