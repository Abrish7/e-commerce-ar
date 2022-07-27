import 'package:ecommerce_v3/presentations/widgets/screen.home/home_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/product/product_cubit.dart';
import '../widgets/screen.home/home_top_app_bar.dart';
import '../widgets/screen.main/drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductCubit>(context).loadProduct();

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: NestedScrollView(
        physics: ScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [HomeTopAppBar(scaffoldKey: _scaffoldKey)],
        body: HomeWidget(),
      ),
      drawer: const DrawerWidget(),
      drawerDragStartBehavior: DragStartBehavior.start,
    );
  }
}
