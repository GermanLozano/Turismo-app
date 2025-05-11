

// esta clase es un contrato que se especifiica de las funcionalidades que se deben implementar 


import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/features/user/domain/entities/user_entity.dart';

abstract interface class RepositoryInterface {

  FutureEither<UserEntity> signIn({
    required String email,
    required String password,
  });


  FutureEither<bool> signUp({
    required UserEntity userEntity,
  });


  FutureEither<bool> logOut(
    
  );

  // se agregan las demas funcionalidades en caso de requerirsen 

}
