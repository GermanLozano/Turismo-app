import 'package:dartz/dartz.dart';
import 'package:turismo_app/src/core/error/error.dart';
import 'package:turismo_app/src/core/error/exeptions.dart';
import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/features/user/data/data_sources/remote/remote_data_source_interface.dart';
import 'package:turismo_app/src/features/user/domain/entities/user_entity.dart';
import 'package:turismo_app/src/features/user/domain/repository/repository_interface.dart';

class RepositoryImplementation implements RepositoryInterface {
  RepositoryImplementation({
    required this.remoteDataSourceInterface,
  });

  final RemoteDataSourceInterface remoteDataSourceInterface;

  // la implementacion del metodo de inicio de sesion

  @override
  FutureEither<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSourceInterface.signIn(
        email: email,
        password: password,
      );
      return Right(result);
    } on ServerException catch (e) {
      final result = ServerFailure(e.message);
      return Left(result);
    }
  }

  // implementacion del metodo de registro

  @override
  FutureEither<bool> signUp({required UserEntity userEntity}) async {
    try {
      final result = await remoteDataSourceInterface.signUp(
        userEntity: userEntity,
      );
      return Right(result);
    } on ServerException catch (e) {
      final result = ServerFailure(e.message);
      return Left(result);
    }
  }

  // implementacion del metodo de cerrar sesion

  @override
  FutureEither<bool> logOut() async {
    try {
      final result = await remoteDataSourceInterface.logOut();
      return Right(result);
    } on ServerException catch (e) {
      final result = ServerFailure(e.message);
      return Left(result);
    }
  }
}
