part of 'tag_cubit.dart';

abstract class TagState extends Equatable {
  const TagState();

  @override
  List<Object> get props => [];
}

class TagLoaded extends TagState {
  List<TagModel> tags;
  TagLoaded({required this.tags});
}

class TagInitial extends TagState {}
