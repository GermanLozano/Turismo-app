import 'package:equatable/equatable.dart';
import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/core/use_cases/use_cases.dart';
import 'package:turismo_app/src/features/user/domain/entities/user_entity.dart';
import 'package:turismo_app/src/features/user/domain/repository/repository_interface.dart';

class SignInUseCase implements UseCaseInterface<UserEntity, SignInParamsUseCases> {
  
  SignInUseCase({required this.repositoryInterface});

  final RepositoryInterface repositoryInterface;

  @override
  FutureEither<UserEntity> call(SignInParamsUseCases paramsType) async {
    final result = await repositoryInterface.signIn(
      email: paramsType.email,
      password: paramsType.password,
    );
    return result;
  }
}

class SignInParamsUseCases extends Equatable {
  const SignInParamsUseCases({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  List<Object?> get props => [];
}
