import 'package:ecommerce_v3/data/model/order_model.dart';
import 'package:ecommerce_v3/data/provider/order_api.dart';

class OrderRepository {
  OrderApi _orderApi = OrderApi();
  Future<List<Order>> getOrder({required customerId}) async {
    final order = await _orderApi.getOrder(customerId: customerId);
    print("order length: " + order.toString());
    List<Order> response = order.map((e) => Order.fromJson(e)).toList();
    return response;
  }
}
