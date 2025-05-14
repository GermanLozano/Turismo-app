part of 'category_managemen_bloc.dart';

sealed class CategoryManagemenState extends Equatable {
  const CategoryManagemenState();

  @override
  List<Object?> get props => [];
}

final class CategoryInitial extends CategoryManagemenState {}

final class CategoryLoading extends CategoryManagemenState {}

final class CategoryLoaded extends CategoryManagemenState {
  const CategoryLoaded({required this.categories, this.categorySelected});
  final List<CategoryEntity> categories;
  final CategoryEntity? categorySelected;

  @override
  List<Object?> get props => [categories, categorySelected];
}

final class CategoryError extends CategoryManagemenState {
  const CategoryError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
