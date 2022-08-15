// ignore_for_file: deprecated_member_use

import 'package:ecommerce_v3/data/model/user_model.dart';
import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return UserAccountsDrawerHeader(
                accountName: Text(state.user.firstname),
                accountEmail: Text(state.user.email),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(child: Image.asset('assets/images/shoe.png')),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          Image.asset('assets/images/drawerHeader.jpg').image,
                      fit: BoxFit.fill),
                ),
              );
            },
          ),
          _drawerListOfActions(context, '/home', "Home", (Icons.home)),
          _drawerListOfActions(context, '/profile', "Profile", (Icons.person)),
          Container(
            height: .2,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: const Text('my shop', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          _drawerListOfActions(context, '/cart', "Cart", (Icons.shopping_cart)),
          _drawerListOfActions(context, '/order', "Order", (Icons.list)),
          _drawerListOfActions(context, '/saved', "Saved", (Icons.favorite)),
          Container(
            height: .2,
            color: Colors.grey,
          ),
          _drawerListOfActions(
              context, '/category', "Category", (Icons.category)),
          _drawerListOfActions(context, '/deals', "Deals", (Icons.handshake)),
          _drawerListOfActions(
              context, '/setting', "Setting", (Icons.settings)),
          _drawerListOfActions(context, '', "Sign out", (Icons.logout),
              hasRoute: true),
        ],
      ),
    );
  }

  Column _drawerListOfActions(
      BuildContext context, String path, String title, IconData icon,
      {bool hasRoute = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RaisedButton(
              color: Colors.white,
              elevation: 0,
              onPressed: () {
                if (!hasRoute) {
                  Navigator.pushNamed(context, path);
                } else {
                  _logOut();

                  BlocProvider.of<UserCubit>(context).setUserData(User(
                      id: "",
                      firstname: "",
                      lastname: "",
                      username: "",
                      email: "",
                      createAt: "",
                      updateAt: "",
                      token: ""));
                  Navigator.of(context).pushNamed('/');
                }
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(icon),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(title)
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  _logOut() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString("id", "");
    prefs.setString("firstName", "");
    prefs.setString("lastName", "");
    prefs.setString("email", "");
    prefs.setString("username", "");
    prefs.setString("createdAt", "");
    prefs.setString("updatedAt", "");
    prefs.setString("token", "");
    print('token are remover');
  }
}
