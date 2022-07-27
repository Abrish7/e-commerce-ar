import 'package:flutter/material.dart';

import '../widgets/screen.profile/profile_top_app_bar.dart';
import '../widgets/screen.profile/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: ProfileTopAppBar(
            scaffoldKey: _scaffoldKey,
          ),
          preferredSize: Size.fromHeight(65)),
      body: const ProfileWidget(),
    );
  }
}
