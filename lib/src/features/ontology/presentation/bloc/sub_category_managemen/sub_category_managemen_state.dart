part of 'sub_category_managemen_bloc.dart';

sealed class SubCategoryManagemenState extends Equatable {
  const SubCategoryManagemenState();
  @override
  List<Object?> get props => [];
}

final class SubCategoryInitial extends SubCategoryManagemenState {}

final class SubCategoryLoading extends SubCategoryManagemenState {}

final class SubCategoryLoaded extends SubCategoryManagemenState {
  const SubCategoryLoaded({required this.categories, this.categorySeleted});
  final List<CategoryEntity> categories;
  final CategoryEntity? categorySeleted;

  @override
  List<Object?> get props => [categories, categorySeleted];
}

final class SubCategoryError extends SubCategoryManagemenState {
  const SubCategoryError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
