import 'package:ecommerce_v3/presentations/screens/home_screen.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.main/drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/user_model.dart';
import '../../logic/auth/cubit/user_cubit.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String token = "";

  @override
  void initState() {
    super.initState;
    _isLoggedIn();
  }

  _isLoggedIn() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences profs = await _prefs;
    // print('auth widget..');
    // if (profs.getString("token")!.isNotEmpty) {
    //   print('first name value0: ' + profs.getString("firstName")!);
    BlocProvider.of<UserCubit>(context).setUserData(User(
        id: profs.getString("id").toString(),
        firstname: profs.getString("firstName").toString(),
        lastname: profs.getString("lastName").toString(),
        username: profs.getString("username").toString(),
        email: profs.getString("email").toString(),
        createAt: profs.getString("updatedAt").toString(),
        updateAt: profs.getString("createdAt").toString(),
        token: profs.getString("token").toString()));

    // BlocProvider.of<AuthBloc>(context)
    //     .add(IsAlreadyLoggedIn(isUserLoggedIn: true));
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: HomeScreen(),
      drawer: const DrawerWidget(),
      drawerDragStartBehavior: DragStartBehavior.start,
    );
  }
}
