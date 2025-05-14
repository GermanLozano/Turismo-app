part of 'individual_bloc_management_bloc.dart';

sealed class IndividualBlocManagementState extends Equatable {
  const IndividualBlocManagementState();

  @override
  List<Object> get props => [];
}

final class IndividualBlocManagementInitial
    extends IndividualBlocManagementState {}

final class IndividualBlocManagementLoading
    extends IndividualBlocManagementState {}

final class IndividualBlocManagementLoaded
    extends IndividualBlocManagementState {
  const IndividualBlocManagementLoaded({required this.individuals});
  final List<IndividualEntity> individuals;

  @override
  List<Object> get props => [individuals];
}

final class IndividualBlocManagementError
    extends IndividualBlocManagementState {
  const IndividualBlocManagementError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
