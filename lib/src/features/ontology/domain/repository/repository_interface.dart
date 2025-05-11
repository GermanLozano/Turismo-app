

import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/category_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/venue_entitydart';

abstract interface class RepositoryInterface {
  
  FutureEither<List<CategoryEntity>> getCategories();
  FutureEither<List<CategoryEntity>> getSubCategories({required CategoryEntity categoria});
  FutureEither<List<VenueEntity>> popularVeune();

}
