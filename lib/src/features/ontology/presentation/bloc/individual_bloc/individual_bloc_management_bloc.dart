import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turismo_app/src/core/config/config.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/use_cases/get_individual.dart';

part 'individual_bloc_management_event.dart';
part 'individual_bloc_management_state.dart';

class IndividualBlocManagementBloc
    extends Bloc<IndividualBlocManagementEvent, IndividualBlocManagementState> {
  IndividualBlocManagementBloc({required this.getIndividualUseCase})
      : super(IndividualBlocManagementInitial()) {
    on<GetIndividuals>(_onGetIndividuals);
  }

  final GetIndividualUseCase getIndividualUseCase;
  Future<void> _onGetIndividuals(
    GetIndividuals event,
    Emitter<IndividualBlocManagementState> emit,
  ) async {
    // Definimos los valores que vamos a usar
    var query = event.query;
    var offset = event.offSet;
    var category = event.category;

    // Recuperamos los datos del estado actual si es Loaded
    if (state is IndividualBlocManagementLoaded) {
      final currentState = state as IndividualBlocManagementLoaded;
      query ??= currentState.query;
      category ??= currentState.category;
      offset ??= currentState.offset;
    }

    // Aquí recién emitimos el estado de carga
    emit(IndividualBlocManagementLoading());

    // Ejecutamos la funciona
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
