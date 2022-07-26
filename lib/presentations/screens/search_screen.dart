import 'package:ecommerce_v3/presentations/widgets/screen.search/search_top_app_bar.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(63.0),
        child: SearchTopAppBar(),
      ),
      body: SearchWidget(),
    );
  }
}
