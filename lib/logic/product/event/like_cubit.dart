import 'package:ecommerce_v3/logic/product/event/like_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeState(isLiked: false));
  void setLikeState() => emit(LikeState(isLiked: !state.isLiked));
}
