import 'package:ecommerce_v3/data/model/user_model.dart';
import 'package:ecommerce_v3/logic/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.auth/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // late String token = "";

  @override
  void initState() {
    super.initState;
    _isLoggedIn();
  }

  _isLoggedIn() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences profs = await _prefs;

    print('auth');
    if (profs.getString("token")!.isNotEmpty) {
      BlocProvider.of<AuthBloc>(context)
          .add(IsAlreadyLoggedIn(isUserLoggedIn: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Card(
                    borderOnForeground: true,
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: AuthWidget(globalContext: _scaffoldKey),
                    ),
                  ),
                ),
                BlocListener<AuthBloc, AuthState>(
                  listenWhen: (previous, current) =>
                      previous.isAlreadyLoggedIn != current.isAlreadyLoggedIn,
                  listener: (context, state) {
                    if (state.isAlreadyLoggedIn) {
                      Navigator.of(context).pushNamed("/home");
                    } else {
                      print("user logged out");
                      Navigator.of(context).pushNamed("/");
                    }
                  },
                  child: Container(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
