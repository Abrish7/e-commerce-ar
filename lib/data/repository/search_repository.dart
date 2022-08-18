import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_v3/data/model/search_model.dart';
import 'package:ecommerce_v3/data/model/search_product_model.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';
import '../../logic/cubit/search_cubit.dart';

class SearchRepository {
  @override
  Future<List<SearchProductModel>> searchProducts(query, emit) async {
    print('start searching');
    try {
      SearchModel model = SearchModel(
          docs: [],
          hasNextPage: false,
          totalPages: 0,
          nextPage: null,
          hasPrevPage: false,
          limit: 0,
          page: 0,
          pagingCounter: 0,
          prevPage: null,
          totalDocs: 0);

      final response = await http
          .post(Uri.parse(Configurations().getSearchUrl()),
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json',
              },
              body: jsonEncode(<String, String>{'searchString': query}))
          .then((response) {
        print('incoming...');
        print(response.body.toString());
        model = searchModelFromJson(response.body);

        print(' wow ' + model.docs.toString());
      });

      // products.map((e) {
      print(model.docs[0].name.toString());

      emit(SearchLoaded(products: model));
      return [];
    } catch (e) {
      print(' :: search error :: ');
      return [];
    }
  }
}
