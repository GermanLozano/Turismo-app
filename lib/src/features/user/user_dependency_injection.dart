import 'package:turismo_app/src/core/config/config.dart';
import 'package:turismo_app/src/features/user/data/data_sources/remote/remote_data_source_implementation.dart';
import 'package:turismo_app/src/features/user/data/data_sources/remote/remote_data_source_interface.dart';
import 'package:turismo_app/src/features/user/data/repository/repository_implementation.dart';
import 'package:turismo_app/src/features/user/domain/repository/repository_interface.dart';
import 'package:turismo_app/src/features/user/domain/use_cases/log_out_use_case.dart';
import 'package:turismo_app/src/features/user/domain/use_cases/sign_in_use_case.dart';
import 'package:turismo_app/src/features/user/domain/use_cases/sign_up_use_case.dart';
import 'package:turismo_app/src/features/user/presentation/bloc/user_auth/user_auth_bloc.dart';

class UserDependencyInjection {
  static Future<void> init() async {
    //------------------------ Blocs-providers state management ------------------------
    sl
      ..registerLazySingleton<UserAuthBloc>(
        () => UserAuthBloc(
          signInUseCase: sl(),
          signUpUseCase: sl(),
          logOutUseCase: sl(),
        ),
      )

      // ------------------------ Use cases ------------------------
      ..registerLazySingleton<SignInUseCase>(
        () => SignInUseCase(
          repositoryInterface: sl(),
        ),
      )
      ..registerLazySingleton<SignUpUseCase>(
        () => SignUpUseCase(
          repositoryInterface: sl(),
        ),
      )
      ..registerLazySingleton<LogOutUseCase>(
        () => LogOutUseCase(
          repositoryInterface: sl(),
        ),
      )

      // ------------------------ Repositories ------------------------
      ..registerLazySingleton<RepositoryInterface>(
        () => RepositoryImplementation(
          remoteDataSourceInterface: sl(),
        ),
      )
      // ------------------------ Data Sources ------------------------
      ..registerLazySingleton<RemoteDataSourceInterface>(
        () => RemoteDataSourceImplementation(
          client: sl(),
        ),
      );
    // ---------------
  }
}
