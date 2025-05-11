

import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/core/use_cases/use_cases.dart';
import 'package:turismo_app/src/features/user/domain/entities/user_entity.dart';
import 'package:turismo_app/src/features/user/domain/repository/repository_interface.dart';

class SignUpUseCase implements UseCaseInterface<bool, UserEntity> {
  SignUpUseCase({required this.repositoryInterface});

  final RepositoryInterface repositoryInterface;

  @override
  FutureEither<bool> call(UserEntity paramsType) async {
    final result = await repositoryInterface.signUp(
      userEntity: paramsType,
      );
    return result;
  }
}
