part of 'category_managemen_bloc.dart';

sealed class CategoryManagemenEvent extends Equatable {
  const CategoryManagemenEvent();

  @override
  List<Object> get props => [];
}

final class GetCategoriesEvent extends CategoryManagemenEvent {}

final class GetSubCategoriesEvent extends CategoryManagemenEvent {
  const GetSubCategoriesEvent({required this.category});

  final CategoryEntity category;

  @override
  List<Object> get props => [category];
}
