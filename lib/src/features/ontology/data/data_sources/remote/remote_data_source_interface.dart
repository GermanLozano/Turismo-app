import 'package:turismo_app/src/features/ontology/data/models/category_model.dart';
import 'package:turismo_app/src/features/ontology/data/models/individual_model.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';

abstract interface class RemoteDataSourceInterface {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getSubCategories({
    required CategoryEntity categoria,
  });
  Future<List<IndividualModel>> getPopularIndividual();
  Future<List<IndividualModel>> getIndividual({
    String? queryData,
    int? offset,
    String? category,
  });
}
