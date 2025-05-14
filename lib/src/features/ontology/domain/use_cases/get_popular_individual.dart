import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/core/use_cases/use_cases.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/repository/repository_interface.dart';

class GetPopularIndividualUseCase
    implements UseCaseInterface<List<IndividualEntity>, NoParams> {
  GetPopularIndividualUseCase({required this.repositoryInterface});

  final RepositoryInterface repositoryInterface;

  @override
  FutureEither<List<IndividualEntity>> call(NoParams paramsType) async {
    final result = await repositoryInterface.getPopularIndividual();
    return result;
  }
}
