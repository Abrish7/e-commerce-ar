part of 'tag_product_cubit.dart';

abstract class TagProductState extends Equatable {
  const TagProductState();

  @override
  List<Object> get props => [];
}

class TagProductInitial extends TagProductState {}

class TagProductLoading extends TagProductState {}

class TagProductLoaded extends TagProductState {
  List<TagProduct> product;
  TagProductLoaded({required this.product});
}
