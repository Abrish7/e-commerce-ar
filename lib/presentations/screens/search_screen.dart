import 'package:ecommerce_v3/presentations/widgets/screen.search/search_top_app_bar.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
