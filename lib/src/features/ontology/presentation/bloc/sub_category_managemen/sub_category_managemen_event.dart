part of 'sub_category_managemen_bloc.dart';

sealed class SubCategoryManagemenEvent extends Equatable {
  const SubCategoryManagemenEvent();

  @override
  List<Object?> get props => [];
}

final class GetSubSubCategoriesEvent extends SubCategoryManagemenEvent {
  const GetSubSubCategoriesEvent({required this.category});

  final CategoryEntity category;

  @override
  List<Object> get props => [category];
}

final class SelectSubCategoryEvent extends SubCategoryManagemenEvent {
  const SelectSubCategoryEvent({this.category});
  final CategoryEntity? category;

  @override
  List<Object?> get props => [category];
}
