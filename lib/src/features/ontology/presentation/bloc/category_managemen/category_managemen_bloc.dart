import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:turismo_app/src/core/use_cases/use_cases.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/use_cases/get_categories_use_case.dart';

part 'category_managemen_event.dart';
part 'category_managemen_state.dart';

class CategoryManagemenBloc
    extends Bloc<CategoryManagemenEvent, CategoryManagemenState> {
  CategoryManagemenBloc({
    required this.getCategoriesUseCase,
  }) : super(CategoryInitial()) {
    on<GetCategoriesEvent>(_onGetCategories);
    on<SelectCategoryEvent>(_onSelectCategory);
  }
  final GetCategoriesUseCase getCategoriesUseCase;

  Future<void> _onGetCategories(
    GetCategoriesEvent event,
    Emitter<CategoryManagemenState> emit,
  ) async {
    emit(CategoryLoading());

    final result = await getCategoriesUseCase(
      NoParams(),
    );

    result.fold(
      (failure) => emit(
        CategoryError(
          failure.message,
        ),
      ),
      (success) {
        emit(
          CategoryLoaded(categories: success),
        );
      },
    );
  }

  Future<void> _onSelectCategory(
    SelectCategoryEvent event,
    Emitter<CategoryManagemenState> emit,
  ) async {
    if (state is CategoryLoaded) {
      final loadedState = state as CategoryLoaded;
      emit(
        CategoryLoaded(
          categorySelected: event.category,
          categories: loadedState.categories,
        ),
      );
    }
  }
}
