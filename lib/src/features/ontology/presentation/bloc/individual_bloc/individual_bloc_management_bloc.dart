import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/use_cases/get_individual.dart';

part 'individual_bloc_management_event.dart';
part 'individual_bloc_management_state.dart';

class IndividualBlocManagementBloc
    extends Bloc<IndividualBlocManagementEvent, IndividualBlocManagementState> {
  IndividualBlocManagementBloc({required this.getIndividualUseCase}) : super(IndividualBlocManagementInitial()) {
    on<GetIndividuals> (_onGetIndividuals);
  }

  final GetIndividualUseCase getIndividualUseCase;

  Future<void> _onGetIndividuals(
  GetIndividuals event,
  Emitter<IndividualBlocManagementState> emit,
) async {
  emit(IndividualBlocManagementLoading());

  // Usamos valores anteriores si no se envían nuevos
  var query = event.query;
  var category = event.category;
  var offset = event.offSet;

  if (state is IndividualBlocManagementLoaded) {
    final currentState = state as IndividualBlocManagementLoaded;
    query ??= currentState.query;
    category ??= currentState.category;
    offset = event.offSet ?? currentState.offset;
  }

  final result = await getIndividualUseCase(
    GetIndividualParams(query: query, category: category, offSet: offset),
  );

  result.fold(
    (failure) => emit(IndividualBlocManagementError(failure.message)),
    (individuals) => emit(
      IndividualBlocManagementLoaded(
        individuals: individuals,
        offset: offset,
        query: query,
        category: category,
      ),
    ),
  );
}


    

}
