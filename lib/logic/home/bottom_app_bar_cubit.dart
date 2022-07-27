import 'package:flutter_bloc/flutter_bloc.dart';

class BottomAppBarCubit extends Cubit<BottomAppBarState> {
  BottomAppBarCubit()
      : super(BottomAppBarState(
            isCartClicked: false,
            isProductClicked: false,
            isFavClicked: false,
            isOrderClicked: false,
            isSettingClicked: false));
  void setBottomAppBarState(BottomAppBarState bottomAppBarState) {
    emit(bottomAppBarState);
  }
}

class BottomAppBarState {
  final bool isProductClicked;
  final bool isFavClicked;
  final bool isCartClicked;
  final bool isOrderClicked;
  final bool isSettingClicked;
  BottomAppBarState(
      {required this.isProductClicked,
      required this.isFavClicked,
      required this.isCartClicked,
      required this.isOrderClicked,
      required this.isSettingClicked});
}
