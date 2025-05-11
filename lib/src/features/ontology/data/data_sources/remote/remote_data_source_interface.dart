

import 'package:turismo_app/src/features/ontology/data/models/category_model.dart';

abstract interface class RemoteDataSourceInterface {
  Future<List<CategoryModel>> getCategories();
  //Future<List<Cat>> getSubCategories({required CategoryEntity categoria});
  //Future<List<VenueEntity>> popularVeune();
}
