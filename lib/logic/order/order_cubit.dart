import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/model/order_model.dart';
import 'package:ecommerce_v3/data/repository/order_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  void getOrder() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences profs = await _prefs;
    print("USER ID FROM ORDER CUBIT: " + profs.getString("id").toString());
    await OrderRepository()
        .getOrder(customerId: profs.getString("id").toString())
        .then((value) {
      print('emit order ...' + value[0].paymentReference.toString());
      emit(OrderLoaded(order: value));
    });
  }
}
