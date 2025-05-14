import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/use_cases/get_subcategories_use_case.dart';

part 'sub_category_managemen_event.dart';
part 'sub_category_managemen_state.dart';

class SubCategoryManagemenBloc
    extends Bloc<SubCategoryManagemenEvent, SubCategoryManagemenState> {
  SubCategoryManagemenBloc({required this.getSubCategoriesUseCase})
      : super(SubCategoryInitial()) {
    on<GetSubSubCategoriesEvent>(_onGetSubCategories);
    on<SelectSubCategoryEvent>(_onSelectCategory);
  }
  final GetSubCategoriesUseCase getSubCategoriesUseCase;

  Future<void> _onGetSubCategories(
    GetSubSubCategoriesEvent event,
    Emitter<SubCategoryManagemenState> emit,
  ) async {
    emit(SubCategoryLoading());

    final result = await getSubCategoriesUseCase(event.category);

    result.fold(
      (failure) => emit(
        SubCategoryError(
          failure.message,
        ),
      ),
      (success) {
        //customLog(success.first.nombreCategoria);
        emit(
          SubCategoryLoaded(categories: success),
        );
      },
    );
  }

  Future<void> _onSelectCategory(
    SelectSubCategoryEvent event,
    Emitter<SubCategoryManagemenState> emit,
  ) async {
    if (state is SubCategoryLoaded) {
      final loadedState = state as SubCategoryLoaded;
      emit(
        SubCategoryLoaded(
          categorySeleted: event.category,
          categories: loadedState.categories,
        ),
      );
    }
  }
}
