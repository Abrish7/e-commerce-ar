import 'package:ecommerce_v3/presentations/widgets/screen.setting/setting_top_app_bar.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.setting/setting_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(63.0),
        child: SettingTopAppBar(),
      ),
      body: SettingWidget(),
    );
  }
}
