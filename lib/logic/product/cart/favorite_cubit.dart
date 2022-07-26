import 'package:ecommerce_v3/data/model/favorite_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit()
      : super(FavoriteState(fav: {0: Favorite(isFav: true, productId: 0)}));

  void addFavoriteProduct(Favorite fav) {
    Map<int, Favorite> temp = state.fav;
    temp.putIfAbsent(fav.productId, () => fav);
    emit((FavoriteState(fav: temp)));
  }

  void removeFavoriteProduct(int id) {
    Map<int, Favorite> temp = state.fav;
    temp.remove(id);
    emit(FavoriteState(fav: temp));
  }
}

class FavoriteState {
  Map<int, Favorite> fav;
  FavoriteState({required this.fav});
}
