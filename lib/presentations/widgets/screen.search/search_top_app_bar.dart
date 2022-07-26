import 'package:flutter/material.dart';

import '../../common/theme_helper.dart';

class SearchTopAppBar extends StatelessWidget {
  const SearchTopAppBar({Key? key}) : super(key: key);

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
            'Search', '', '', false, const Icon(Icons.search)),
        onChanged: (value) {},
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pushNamed('/home');
        },
      ),
    );
  }
}
