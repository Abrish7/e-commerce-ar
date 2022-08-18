import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/search_cubit.dart';
import '../../common/theme_helper.dart';

class SearchDetailTopAppBar extends StatelessWidget {
  const SearchDetailTopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 300.0,
      backgroundColor: Colors.white,
      elevation: 0,
      title: TextFormField(
        autofocus: true,
        obscureText: false,
        decoration: ThemeHelper().searchInputDecoration(
            'product detail', '', '', false, const Icon(Icons.search)),
        onChanged: (value) {
          BlocProvider.of<SearchCubit>(context).getProduct(query: value);
        },
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pushNamed('/search');
        },
      ),
    );
  }
}
