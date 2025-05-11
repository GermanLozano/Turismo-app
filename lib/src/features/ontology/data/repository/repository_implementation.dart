import 'package:dartz/dartz.dart';
import 'package:turismo_app/src/core/error/error.dart';
import 'package:turismo_app/src/core/error/exeptions.dart';
import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/features/ontology/data/data_sources/remote/remote_data_source_interface.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/category_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/venue_entitydart';
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
      return Left(
        ServerFailure('Error en el Servidor ${e.message}'),
      );
    }
  }

  @override
  FutureEither<List<CategoryEntity>> getSubCategories(
      {required CategoryEntity categoria,}) {
    // TODO: implement getSubCategories
    throw UnimplementedError();
  }

  @override
  FutureEither<List<VenueEntity>> popularVeune() {
    // TODO: implement popularVeune
    throw UnimplementedError();
  }
}
