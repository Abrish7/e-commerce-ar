import 'package:flutter/material.dart';

class ProfileTopAppBar extends StatelessWidget {
  const ProfileTopAppBar({Key? key, required this.scaffoldKey})
      : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 300.0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'profile',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ]);
  }
}
