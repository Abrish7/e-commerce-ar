import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(UserState(
            user: User(
                id: "id2",
                firstname: "firstname2",
                lastname: "lastname2",
                username: "username2",
                email: "email2",
                createAt: "createAt2",
                updateAt: "updateAt2",
                token: "")));
  void setUserData(User user) {
    emit(state.copyWith(user: user));
  }
}

// ignore: must_be_immutable
class UserState extends Equatable {
  User user;
  UserState({required this.user});
  UserState copyWith({User? user}) {
    return UserState(user: user ?? this.user);
  }

  @override
  List<Object> get props => [user];
}
