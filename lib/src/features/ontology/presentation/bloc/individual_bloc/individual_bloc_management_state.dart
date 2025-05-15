part of 'individual_bloc_management_bloc.dart';

sealed class IndividualBlocManagementState extends Equatable {
  const IndividualBlocManagementState();

  @override
  List<Object?> get props => [];
}

final class IndividualBlocManagementInitial
    extends IndividualBlocManagementState {}

final class IndividualBlocManagementLoading
    extends IndividualBlocManagementState {}

class IndividualBlocManagementLoaded extends IndividualBlocManagementState {
  const IndividualBlocManagementLoaded({
    required this.individuals,
    this.offset = 0,
    this.query = '',
    this.category = '',
  });
  final List<IndividualEntity> individuals;
  final String? query;
  final String? category;
  final int? offset;

  @override
  List<Object?> get props => [individuals, query, category, offset];
}

final class IndividualBlocManagementError
    extends IndividualBlocManagementState {
  const IndividualBlocManagementError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
