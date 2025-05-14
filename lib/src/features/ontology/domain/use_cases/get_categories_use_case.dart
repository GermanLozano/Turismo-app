

import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/core/use_cases/use_cases.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/repository/repository_interface.dart';

class GetCategoriesUseCase
    implements UseCaseInterface<List<CategoryEntity>, NoParams> {
  GetCategoriesUseCase({required this.repositoryInterface});

  final RepositoryInterface repositoryInterface;

  @override
  FutureEither<List<CategoryEntity>> call(NoParams noParams) async {
    final result = await repositoryInterface.getCategories();
    return result;
  }
}
