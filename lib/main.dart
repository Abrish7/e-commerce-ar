import 'package:ecommerce_v3/config.dart';
import 'package:ecommerce_v3/data/model/tag_product.dart';
import 'package:ecommerce_v3/data/provider/cart_api.dart';
import 'package:ecommerce_v3/data/provider/product_filter_by_category_api.dart';
import 'package:ecommerce_v3/data/repository/cart_repo.dart';
import 'package:ecommerce_v3/data/repository/product_filter_by_category_repo.dart';
import 'package:ecommerce_v3/data/repository/product_repo.dart';
import 'package:ecommerce_v3/logic/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:ecommerce_v3/logic/cart/favorite_cubit.dart';
import 'package:ecommerce_v3/logic/cart/total_cart_cubit.dart';
import 'package:ecommerce_v3/logic/home/bottom_app_bar_cubit.dart';
import 'package:ecommerce_v3/logic/order/order_cubit.dart';
import 'package:ecommerce_v3/logic/other/like_cubit.dart';
import 'package:ecommerce_v3/logic/payment/payment_bloc.dart';
import 'package:ecommerce_v3/logic/product/product_cubit.dart';
import 'package:ecommerce_v3/logic/product/product_filter_by_category_cubit.dart';
import 'package:ecommerce_v3/logic/shipping/shipping_bloc.dart';
import 'package:ecommerce_v3/logic/tag/tag_cubit.dart';
import 'package:ecommerce_v3/logic/tag/tag_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'data/provider/product_api.dart';
import 'logic/cart/load_cart/cart_cubit.dart';
import 'logic/cart/quantity_cubit.dart';
import 'logic/category/product_category_cubit.dart';
import 'logic/sub_category/sub_category_cubit.dart';
import 'presentations/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = Configurations().getStripePublicKey();
  await Stripe.instance.applySettings();
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
        // Product fetch by category cubit
        BlocProvider<ProductFilterByCategoryCubit>(
            create: (context) => ProductFilterByCategoryCubit(
                ProductFilterByCategoryRepo(
                    productApi: ProductFilterByCategoryApi()))),
        // Product Cart Cubit
        BlocProvider<CartCubit>(
            create: (context) => CartCubit(CartRepository(cartApi: CartApi()))),
        // Product Cubit
        BlocProvider<ProductCubit>(
            create: (context) =>
                ProductCubit(ProductRepo(productApi: ProductApi()))
                  ..loadProduct()),
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
        BlocProvider<FavoriteCubit>(create: (context) => FavoriteCubit()),
        // Payment Bloc
        BlocProvider<PaymentBloc>(create: (context) => PaymentBloc()),
        // Shipping form Bloc
        BlocProvider<ShippingBloc>(create: (context) => ShippingBloc()),
        // Total Cart Cubit
        BlocProvider<TotalCartCubit>(create: (context) => TotalCartCubit()),
        // Order Cubit
        BlocProvider<OrderCubit>(create: (context) => OrderCubit()),
        // Tag Cubit
        BlocProvider<TagCubit>(create: (context) => TagCubit()..getTag()),
        // Tag product Cubit
        BlocProvider<TagProductCubit>(create: (context) => TagProductCubit())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
