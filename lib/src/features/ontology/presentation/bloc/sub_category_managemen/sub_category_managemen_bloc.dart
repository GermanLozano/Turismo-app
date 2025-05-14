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
    on<SubGetSubCategoriesEvent>(_onGetSubCategories);
  }
  final GetSubCategoriesUseCase getSubCategoriesUseCase;

  Future<void> _onGetSubCategories(
    SubGetSubCategoriesEvent event,
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
      (susses) {
        //customLog(susses.first.nombreCategoria);
        emit(
          SubCategoryLoaded(categories: susses),
        );
      },
    );
  }

  void categorySeleted(CategoryEntity? category) => emit(
        SubCategoryLoaded(
          categorySeleted: category,
          categories: (state as SubCategoryLoaded).categories,
        ),
      );
}
