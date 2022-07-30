import 'package:flutter_bloc/flutter_bloc.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeState(isLiked: false));
  void setLikeState() => emit(LikeState(isLiked: !state.isLiked));
}

class LikeState {
  final bool isLiked;

  LikeState({required this.isLiked});
}
