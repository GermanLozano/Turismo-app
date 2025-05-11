import 'package:turismo_app/src/features/user/domain/entities/user_entity.dart';

abstract interface class RemoteDataSourceInterface {
  Future<UserEntity> signIn({
    required String email,
    required String password,
  });

  Future<bool> signUp({required UserEntity userEntity});

  Future<bool> logOut();
  
}
