

import 'package:turismo_app/src/core/type_defs/type_defs.dart';
import 'package:turismo_app/src/core/use_cases/use_cases.dart';
import 'package:turismo_app/src/features/user/domain/repository/repository_interface.dart';

class LogOutUseCase implements UseCaseInterface<bool, NoParams> {

  LogOutUseCase({required this.repositoryInterface});

  final RepositoryInterface repositoryInterface;

  @override
  FutureEither<bool> call(NoParams noParams) async {
    final result = await repositoryInterface.logOut();
    return result;
  }

}
