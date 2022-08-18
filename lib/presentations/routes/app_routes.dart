import 'package:ecommerce_v3/presentations/common/screen_arguments.dart';
import 'package:ecommerce_v3/presentations/screens/ar_screen.dart';
import 'package:ecommerce_v3/presentations/screens/auth_screen.dart';
import 'package:ecommerce_v3/presentations/screens/cart_screen.dart';
import 'package:ecommerce_v3/presentations/screens/order_screen.dart';
import 'package:ecommerce_v3/presentations/screens/payment_type_screen.dart';
import 'package:ecommerce_v3/presentations/screens/product_category_screen.dart';
import 'package:ecommerce_v3/presentations/screens/home_screen.dart';
import 'package:ecommerce_v3/presentations/screens/product_detail_screen.dart';
import 'package:ecommerce_v3/presentations/screens/product_filter_by_tag_screen.dart';
import 'package:ecommerce_v3/presentations/screens/product_filter_screen.dart';
import 'package:ecommerce_v3/presentations/screens/product_screen.dart';
import 'package:ecommerce_v3/presentations/screens/main_screen.dart';
import 'package:ecommerce_v3/presentations/screens/product_sub_category_screen.dart';
import 'package:ecommerce_v3/presentations/screens/profile_screen.dart';
import 'package:ecommerce_v3/presentations/screens/search_detail_screen.dart';
import 'package:ecommerce_v3/presentations/screens/search_screen.dart';
import 'package:ecommerce_v3/presentations/screens/setting_screen.dart';
import 'package:ecommerce_v3/presentations/screens/shipping_screen.dart';
import 'package:flutter/material.dart';

import '../screens/payment_screen.dart';
import '../screens/product_filter_detail_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    final category = routeSettings.arguments;
    final tags = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case '/ar':
        return MaterialPageRoute(builder: (_) => ArScreen());
      case '/cart':
        return MaterialPageRoute(builder: (_) => CartScreen());
      case '/category':
        return MaterialPageRoute(builder: (_) => const ProductCategoryScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/main':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case '/order':
        return MaterialPageRoute(builder: (_) => OrderScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case '/product':
        return MaterialPageRoute(builder: (_) => const ProductScreen());
      case '/product_filter':
        return MaterialPageRoute(
            builder: (_) => ProductFilterScreen(
                category: (category as Category).category,
                subCategory: (category).subCategory));
      case '/product_filter_by_tag':
        return MaterialPageRoute(
            builder: (_) => const ProductFilterByTagScreen());
      case '/product_detail':
        return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(index: args as int));
      case '/product_filter_detail':
        return MaterialPageRoute(
            builder: (_) => ProductFilterDetailScreen(index: args as int));

      case '/payment_type':
        return MaterialPageRoute(builder: (_) => PaymentTypeScreen());
      case '/payment':
        return MaterialPageRoute(builder: (_) => PaymentScreen());
      case '/subCategory':
        return MaterialPageRoute(builder: (_) => ProductSubCategoryScreen());
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case '/search_detail':
        return MaterialPageRoute(builder: (_) => const SearchDetailsScreen());
      case '/setting':
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case '/shipping':
        return MaterialPageRoute(builder: (_) => const ShippingScreen());
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
