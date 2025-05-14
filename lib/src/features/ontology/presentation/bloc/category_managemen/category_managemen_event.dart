part of 'category_managemen_bloc.dart';

sealed class CategoryManagemenEvent extends Equatable {
  const CategoryManagemenEvent();

  @override
  List<Object> get props => [];
}

final class GetCategoriesEvent extends CategoryManagemenEvent {}

final class SelectCategoryEvent extends CategoryManagemenEvent {
  const SelectCategoryEvent({required this.category});
  final CategoryEntity category;

  @override
  List<Object> get props => [category];
}
