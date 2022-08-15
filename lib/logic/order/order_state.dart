part of 'order_cubit.dart';

class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoaded extends OrderState {
  final List<Order> order;
  OrderLoaded({required this.order});
}
