part of 'popular_individual_bloc_management_bloc.dart';

sealed class PopularIndividualBlocManagementEvent extends Equatable {
  const PopularIndividualBlocManagementEvent();

  @override
  List<Object> get props => [];
}

final class GetPopularIndividualEvent
    extends PopularIndividualBlocManagementEvent {}
