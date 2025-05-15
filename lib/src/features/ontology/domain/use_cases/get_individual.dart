import 'package:equatable/equatable.dart';
import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/core/use_cases/use_cases.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/repository/repository_interface.dart';

class GetIndividualUseCase
    implements UseCaseInterface<List<IndividualEntity>, GetIndividualParams> {
  GetIndividualUseCase({required this.repositoryInterface});

  final RepositoryInterface repositoryInterface;

  @override
  FutureEither<List<IndividualEntity>> call(GetIndividualParams getIndividualParams) async {
    final result = await repositoryInterface.getIndividual(
      queryData: getIndividualParams.query,
      offset: getIndividualParams.offSet,
      category: getIndividualParams.category,
    );
    return result;
  }
}

class GetIndividualParams extends Equatable {
  const GetIndividualParams({
    this.query,
    this.offSet,
    this.category,
  });
  final String? category;
  final String? query;
  final int? offSet;

  @override
  List<Object?> get props => [
    query,
    offSet, 
    category,
  ];
}
