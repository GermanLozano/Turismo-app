part of 'category_managemen_bloc.dart';

sealed class CategoryManagemenState extends Equatable {
  const CategoryManagemenState();
  
  @override
  List<Object> get props => [];
}


final class CategoryInitial extends CategoryManagemenState {}

final class CategoryLoading extends CategoryManagemenState {}


final class CategoryLoaded extends CategoryManagemenState {

  const CategoryLoaded(this.categories);
  final List<CategoryEntity> categories;

  @override
  List<Object> get props => [categories];
}

final class CategoryError extends CategoryManagemenState {

  const CategoryError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
