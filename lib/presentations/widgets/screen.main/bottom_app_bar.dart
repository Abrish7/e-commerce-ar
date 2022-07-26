import 'package:ecommerce_v3/logic/home/bottom_app_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/product/product_cubit.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/product');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.shopping_bag, color: Colors.grey),
                    Text('Product', style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');

                  // BlocProvider.of<BottomAppBarCubit>(context)
                  //     .setBottomAppBarState(BottomAppBarState(
                  //         isProductClicked: false,
                  //         isFavClicked: true,
                  //         isCartClicked: false,
                  //         isOrderClicked: false,
                  //         isSettingClicked: false));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.favorite, color: Colors.grey),
                    Text('Favorite', style: TextStyle(color: Colors.grey))
                  ],
                ),
              )
            ]),
            Row(children: <Widget>[
              MaterialButton(
                // minWidth: 40,
                onPressed: () {
                  BlocProvider.of<BottomAppBarCubit>(context)
                      .setBottomAppBarState(BottomAppBarState(
                          isProductClicked: false,
                          isFavClicked: false,
                          isCartClicked: false,
                          isOrderClicked: true,
                          isSettingClicked: false));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.list, color: Colors.grey),
                    Text('Orders', style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
              MaterialButton(
                // minWidth: 40,
                onPressed: () {
                  BlocProvider.of<BottomAppBarCubit>(context)
                      .setBottomAppBarState(BottomAppBarState(
                          isProductClicked: false,
                          isFavClicked: false,
                          isCartClicked: false,
                          isOrderClicked: false,
                          isSettingClicked: true));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.settings, color: Colors.grey),
                    Text('Setting', style: TextStyle(color: Colors.grey))
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
