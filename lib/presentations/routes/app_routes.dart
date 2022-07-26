import 'package:ecommerce_v3/logic/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:ecommerce_v3/logic/home/bottom_app_bar_cubit.dart';
import 'package:ecommerce_v3/logic/product/cart/cart_cubit.dart';
import 'package:ecommerce_v3/logic/product/cart/favorite_cubit.dart';
import 'package:ecommerce_v3/logic/product/cart/quantity_cubit.dart';
import 'package:ecommerce_v3/logic/product/category/product_category_cubit.dart';
import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:ecommerce_v3/presentations/screens/ar_screen.dart';
import 'package:ecommerce_v3/presentations/screens/auth_screen.dart';
import 'package:ecommerce_v3/presentations/screens/product_category_screen.dart';
import 'package:ecommerce_v3/presentations/screens/home_screen.dart';
import 'package:ecommerce_v3/presentations/screens/product_detail_screen.dart';
import 'package:ecommerce_v3/presentations/screens/product_screen.dart';
import 'package:ecommerce_v3/presentations/screens/main_screen.dart';
import 'package:ecommerce_v3/presentations/screens/product_sub_category_screen.dart';
import 'package:ecommerce_v3/presentations/screens/profile_screen.dart';
import 'package:ecommerce_v3/presentations/screens/search_screen.dart';
import 'package:ecommerce_v3/presentations/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/product/category/product_index_cubit.dart';
import '../../logic/product/sub_category/sub_category_cubit.dart';

class AppRoutes {
  static final AuthBloc _authBloc = AuthBloc();
  static final ProductCategoryCubit _ProductCategoryCubit =
      ProductCategoryCubit();
  static final SubCategoryCubit _subCategoryCubit = SubCategoryCubit();
  static final ProductIndexCubit _ProductIndexCubit = ProductIndexCubit();
  static final ProductCubit _ProductCubit = ProductCubit();
  static final CartCubit _cartCubit = CartCubit();
  static final QuantityCubit _quantityCubit = QuantityCubit();
  static final FavoriteCubit _favCubit = FavoriteCubit();
  static final BottomAppBarCubit _bottomAppBarCubit = BottomAppBarCubit();
  static final UserCubit _userCubit = UserCubit();

  static Route onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        print("from router");
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _authBloc),
                    BlocProvider.value(
                        value: _ProductCategoryCubit
                          ..setProductCategoryLoadedState()),
                    BlocProvider.value(
                        value: _ProductCubit..setProductLoaded()),
                    BlocProvider.value(value: _cartCubit),
                    BlocProvider.value(value: _bottomAppBarCubit),
                    BlocProvider.value(value: _userCubit),
                    BlocProvider.value(value: _subCategoryCubit),
                  ],
                  child: AuthScreen(),
                ));

      case '/home':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _authBloc),
                    BlocProvider.value(
                        value: _ProductCategoryCubit
                          ..setProductCategoryLoadedState()),
                    BlocProvider.value(
                        value: _ProductCubit..setProductLoaded()),
                    BlocProvider.value(value: _cartCubit),
                    BlocProvider.value(value: _bottomAppBarCubit),
                    BlocProvider.value(value: _userCubit),
                    BlocProvider.value(value: _subCategoryCubit),
                  ],
                  child: HomeScreen(),
                ));
      case '/main':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                        value: _ProductCategoryCubit
                          ..setProductCategoryLoadedState()),
                    BlocProvider.value(
                        value: _ProductCubit..setProductLoaded()),
                    BlocProvider.value(value: _authBloc),
                    BlocProvider.value(value: _cartCubit),
                    BlocProvider.value(value: _bottomAppBarCubit),
                    BlocProvider.value(value: _userCubit),
                    BlocProvider.value(value: _subCategoryCubit),
                  ],
                  child: MainScreen(),
                ));
      case '/ar':
        return MaterialPageRoute(
          builder: (_) => ArScreen(),
        );
      case '/category':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                        value: _ProductCategoryCubit
                          ..setProductCategoryLoadedState()),
                    BlocProvider.value(
                        value: _ProductCubit..setProductLoaded()),
                    BlocProvider.value(value: _cartCubit),
                    BlocProvider.value(value: _quantityCubit),
                    BlocProvider.value(value: _bottomAppBarCubit),
                    BlocProvider.value(value: _userCubit),
                    BlocProvider.value(value: _subCategoryCubit),
                  ],
                  child: const ProductCategoryScreen(),
                ));
      case '/subCategory':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                  value: _ProductCategoryCubit
                    ..setProductCategoryLoadedState()),
              BlocProvider.value(value: _ProductCubit..setProductLoaded()),
              BlocProvider.value(value: _cartCubit),
              BlocProvider.value(value: _quantityCubit),
              BlocProvider.value(value: _bottomAppBarCubit),
              BlocProvider.value(value: _userCubit),
              BlocProvider.value(value: _subCategoryCubit),
            ],
            child: const ProductSubCategoryScreen(),
          ),
        );
      case '/search':
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      case '/setting':
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                  value: _ProductCategoryCubit
                    ..setProductCategoryLoadedState()),
              BlocProvider.value(value: _ProductCubit..setProductLoaded()),
              BlocProvider.value(value: _cartCubit),
              BlocProvider.value(value: _bottomAppBarCubit),
              BlocProvider.value(value: _userCubit),
              BlocProvider.value(value: _subCategoryCubit),
            ],
            child: ProfileScreen(),
          ),
        );
      case '/product':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                        value: _ProductCategoryCubit
                          ..setProductCategoryLoadedState()),
                    BlocProvider.value(
                        value: _ProductCubit..setProductLoaded()),
                    BlocProvider.value(value: _cartCubit),
                    BlocProvider.value(value: _quantityCubit),
                    BlocProvider.value(value: _bottomAppBarCubit),
                    BlocProvider.value(value: _userCubit),
                    BlocProvider.value(value: _subCategoryCubit),
                  ],
                  child: const ProductScreen(),
                ));
      case '/product_detail':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                        value: _ProductCubit..setProductLoaded()),
                    BlocProvider.value(
                        value: _ProductCubit..setProductLoaded()),
                    BlocProvider.value(value: _cartCubit),
                    BlocProvider.value(value: _favCubit),
                    BlocProvider.value(value: _quantityCubit),
                    BlocProvider.value(value: _userCubit),
                    BlocProvider.value(value: _subCategoryCubit),
                  ],
                  child: ProductDetailScreen(
                    index: args as int,
                  ),
                ));
      default:
        return errorRoute();
    }
  }

  static Route errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[500],
          title: const Text('Error'),
        ),
        body: const Center(
            child: Text(
          'Page Not Found 404 ',
          style: TextStyle(
              fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),
        )),
      );
    });
  }
}
