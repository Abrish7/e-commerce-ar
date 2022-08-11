import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/logic/auth/cubit/user_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(UserState(
            username: "",
            id: "",
            firstname: "",
            lastname: "",
            email: "",
            token: ""));

  void setUserData() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    emit(state.copyWith(
        id: prefs.getString("id").toString(),
        firstname: prefs.getString("firstName").toString(),
        lastname: prefs.getString("lastName").toString(),
        username: prefs.getString("username").toString(),
        email: prefs.getString("email").toString(),
        token: prefs.getString("token").toString()));
  }
}
