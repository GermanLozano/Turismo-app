part of 'sub_category_managemen_bloc.dart';

sealed class SubCategoryManagemenEvent extends Equatable {
  const SubCategoryManagemenEvent();

  @override
  List<Object> get props => [];
}

final class SubGetSubCategoriesEvent extends SubCategoryManagemenEvent {
  const SubGetSubCategoriesEvent({required this.category});

  final CategoryEntity category;

  @override
  List<Object> get props => [category];
}
