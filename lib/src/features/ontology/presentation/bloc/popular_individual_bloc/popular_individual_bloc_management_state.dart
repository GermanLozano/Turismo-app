part of 'popular_individual_bloc_management_bloc.dart';

sealed class PopularIndividualBlocManagementState extends Equatable {
  const PopularIndividualBlocManagementState();

  @override
  List<Object> get props => [];
}

final class PopularIndividualBlocManagementInitial
    extends PopularIndividualBlocManagementState {}

final class PopularIndividualBlocManagementLoading
    extends PopularIndividualBlocManagementState {}

final class PopularIndividualBlocManagementLoaded
    extends PopularIndividualBlocManagementState {
  const PopularIndividualBlocManagementLoaded({required this.individuals});
  final List<IndividualEntity> individuals;

  @override
  List<Object> get props => [individuals];
}

final class PopularIndividualBlocManagementError
    extends PopularIndividualBlocManagementState {
  const PopularIndividualBlocManagementError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
