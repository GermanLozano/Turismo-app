part of 'individual_bloc_management_bloc.dart';

sealed class IndividualBlocManagementEvent extends Equatable {
  const IndividualBlocManagementEvent();

  @override
  List<Object?> get props => [];
}

final class GetIndividuals extends IndividualBlocManagementEvent {
  const GetIndividuals({
    this.query,
    this.offSet,
    this.category,
  });
  final String? category;
  final String? query;
  final int? offSet;

  @override
  List<Object?> get props => [category, query, offSet];
}
