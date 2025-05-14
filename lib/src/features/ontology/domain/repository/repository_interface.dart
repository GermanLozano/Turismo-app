import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';

abstract interface class RepositoryInterface {
  FutureEither<List<CategoryEntity>> getCategories();
  FutureEither<List<CategoryEntity>> getSubCategories({
    required CategoryEntity categoria,
  });
  FutureEither<List<IndividualEntity>> getPopularIndividual();
  FutureEither<List<IndividualEntity>> getIndividual({
    String? queryData,
    int? offset,
  });
}
