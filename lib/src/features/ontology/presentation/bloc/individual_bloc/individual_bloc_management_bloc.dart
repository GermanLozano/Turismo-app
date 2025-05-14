import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';

part 'individual_bloc_management_event.dart';
part 'individual_bloc_management_state.dart';

class IndividualBlocManagementBloc
    extends Bloc<IndividualBlocManagementEvent, IndividualBlocManagementState> {
  IndividualBlocManagementBloc() : super(IndividualBlocManagementInitial()) {
    on<IndividualBlocManagementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
