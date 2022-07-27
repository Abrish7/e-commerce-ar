import 'package:ecommerce_v3/data/repository/product_repo.dart';
import 'package:ecommerce_v3/logic/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:ecommerce_v3/logic/home/bottom_app_bar_cubit.dart';
import 'package:ecommerce_v3/logic/product/cart/cart_cubit.dart';
import 'package:ecommerce_v3/logic/product/cart/favorite_cubit.dart';
import 'package:ecommerce_v3/logic/product/cart/quantity_cubit.dart';
import 'package:ecommerce_v3/logic/product/category/product_category_cubit.dart';
import 'package:ecommerce_v3/logic/product/event/like_cubit.dart';
import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:ecommerce_v3/logic/product/sub_category/sub_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/provider/product_api.dart';
import 'presentations/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Authentication Bloc
        BlocProvider<AuthBloc>(create: ((context) => AuthBloc())),
        // Product Category Cubit
        BlocProvider<ProductCategoryCubit>(
            create: (context) =>
                ProductCategoryCubit()..setProductCategoryLoadedState()),
        // Product Cubit
        BlocProvider<ProductCubit>(
            create: (context) =>
                ProductCubit(ProductRepo(productApi: ProductApi()))),
        // Product Cart Cubit
        BlocProvider<CartCubit>(create: (context) => CartCubit()),
        // product quantity Cubit
        BlocProvider<QuantityCubit>(create: (context) => QuantityCubit()),
        // bottom app bar Cubit
        BlocProvider<BottomAppBarCubit>(
            create: (context) => BottomAppBarCubit()),
        // User Cubit
        BlocProvider<UserCubit>(create: (context) => UserCubit()),
        // Product sub category cubit
        BlocProvider<SubCategoryCubit>(create: (context) => SubCategoryCubit()),
        // Product isLike Cubit for like & unlike rule
        BlocProvider<LikeCubit>(create: (context) => LikeCubit()),
        // Product Favorite Cubit
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit(),
        )
      ],
      //
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
