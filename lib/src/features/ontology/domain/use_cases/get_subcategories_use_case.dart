import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/core/use_cases/use_cases.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/repository/repository_interface.dart';

class GetSubCategoriesUseCase
    implements UseCaseInterface<List<CategoryEntity>, CategoryEntity> {
  GetSubCategoriesUseCase({required this.repositoryInterface});

  final RepositoryInterface repositoryInterface;

  @override
  FutureEither<List<CategoryEntity>> call(CategoryEntity categoryEntity) async {
    final result =
        await repositoryInterface.getSubCategories(categoria: categoryEntity);
    return result;
  }
}
