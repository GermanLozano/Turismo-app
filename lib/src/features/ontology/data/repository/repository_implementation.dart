import 'package:dartz/dartz.dart';
import 'package:turismo_app/src/core/error/error.dart';
import 'package:turismo_app/src/core/error/exeptions.dart';
import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/features/ontology/data/data_sources/remote/remote_data_source_interface.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/repository/repository_interface.dart';

class RepositoryImplementation implements RepositoryInterface {
  RepositoryImplementation({
    required this.remoteDataSourceInterface,
  });

  final RemoteDataSourceInterface remoteDataSourceInterface;

  @override
  FutureEither<List<CategoryEntity>> getCategories() async {
    try {
      final result = await remoteDataSourceInterface.getCategories();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  FutureEither<List<IndividualEntity>> getIndividual({
    String? category,
    String? queryData,
    int? offset,
  }) async {
    try {
      final result = await remoteDataSourceInterface.getIndividual(
        offset: offset,
        queryData: queryData,
        category: category,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  FutureEither<List<CategoryEntity>> getSubCategories({
    required CategoryEntity categoria,
  }) async {
    try {
      final result = await remoteDataSourceInterface.getSubCategories(
          categoria: categoria,);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  FutureEither<List<IndividualEntity>> getPopularIndividual() async {
    try {
      final result = await remoteDataSourceInterface.getPopularIndividual();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
