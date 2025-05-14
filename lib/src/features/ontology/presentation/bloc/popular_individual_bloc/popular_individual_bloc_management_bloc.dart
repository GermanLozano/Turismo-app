import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turismo_app/src/core/use_cases/use_cases.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/use_cases/get_popular_individual.dart';

part 'popular_individual_bloc_management_event.dart';
part 'popular_individual_bloc_management_state.dart';

class PopularIndividualBlocManagementBloc extends Bloc<
    PopularIndividualBlocManagementEvent,
    PopularIndividualBlocManagementState> {
  PopularIndividualBlocManagementBloc({
    required this.getPopularIndividualUseCase,
  }) : super(PopularIndividualBlocManagementInitial()) {
    on<GetPopularIndividualEvent>(_onGetPopularIndividuals);
  }

  final GetPopularIndividualUseCase getPopularIndividualUseCase;

  Future<void> _onGetPopularIndividuals(
    GetPopularIndividualEvent event,
    Emitter<PopularIndividualBlocManagementState> emit,
  ) async {
    emit(PopularIndividualBlocManagementLoading());
    final result = await getPopularIndividualUseCase(
      NoParams(),
    );

    result.fold(
      (failure) => emit(
        PopularIndividualBlocManagementError(
          failure.message,
        ),
      ),
      (success) {
        emit(
          PopularIndividualBlocManagementLoaded(individuals: success),
        );
      },
    );
  }
}
