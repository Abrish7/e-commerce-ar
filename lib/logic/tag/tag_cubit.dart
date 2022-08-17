import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/repository/tag_repo.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/tag_model.dart';

part 'tag_state.dart';

class TagCubit extends Cubit<TagState> {
  TagCubit() : super(TagInitial());

  void getTag() {
    TagRepository().getTag(emit);
  }
}
