import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/screen.search_detail/serach_detail_app_bar.dart';

class SearchDetailsScreen extends StatelessWidget {
  const SearchDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(63.0),
        child: SearchDetailTopAppBar(),
      ),
      body: SearchDetailsScreen(),
    );
  }
}
