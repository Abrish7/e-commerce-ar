import 'package:ecommerce_v3/logic/home/bottom_app_bar_cubit.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.main/pages/order_list.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.main/pages/product_list.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.main/pages/setting.dart';
import 'package:ecommerce_v3/presentations/widgets/screen.main/pages/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key, required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomAppBarCubit, BottomAppBarState>(
        builder: ((context, appBarState) {
      if (appBarState.isCartClicked) {
        return const ShoppingCart();
      }
      if (appBarState.isFavClicked) {
        //  Navigator.of(context).pushNamed('/home');
        // return const HomeScreen();
        // return const FavoriteList();
      }
      if (appBarState.isOrderClicked) {
        return const OrderList();
      }
      if (appBarState.isProductClicked) {
        return const ProductList();
      }
      if (appBarState.isSettingClicked) {
        return const Setting();
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: RaisedButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Text("start"),
            ),
          ),
        ],
      );
    }));
  }
}
