import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turismo_app/src/core/config/config.dart';
import 'package:turismo_app/src/core/use_cases/use_cases.dart';
import 'package:turismo_app/src/features/user/domain/entities/user_entity.dart';
import 'package:turismo_app/src/features/user/domain/use_cases/log_out_use_case.dart';
import 'package:turismo_app/src/features/user/domain/use_cases/sign_in_use_case.dart';
import 'package:turismo_app/src/features/user/domain/use_cases/sign_up_use_case.dart';

part 'user_auth_event.dart';
part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  
  UserAuthBloc({
    required this.signInUseCase, 
    required this.signUpUseCase, 
    required this.logOutUseCase,
    }) : super(UserAuthInitial()) {

    on<OnGetUserEvent>(_onSignInEvent);
    on<OnSignUpUserEvent>(_onSignUpEvent);
    on<OnLogoutUserEvent>(_onLogOutEvent);
  }

  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final LogOutUseCase logOutUseCase;


  // este es el metodo para iniciar sesion

  Future<void> _onSignInEvent(
    OnGetUserEvent event,
    Emitter<UserAuthState> emit,
  ) async {
    emit(UserAuthLoading());
    final result = await signInUseCase(
      SignInParamsUseCases(
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) {
        customLog('❌ Error en login: ${failure.message}');
        emit(UserAuthFailure(failure.message));
      },
      (susses) {
        customLog(susses.toString());
        emit(
          UserAuthLoaded(susses),
        );
      },
    );
  }

  // este es el metodo para el registro de usuario

  Future<void> _onSignUpEvent(
    OnSignUpUserEvent event,
    Emitter<UserAuthState> emit,
  ) async {
    emit(UserAuthLoading());
    final result = await signUpUseCase(
      event.userEntity,
    );

    result.fold(
      (failure) {
        customLog('❌ Error en el registro: ${failure.message}');
        emit(UserAuthFailure(failure.message));
      },
      (susses) {
        customLog(susses.toString());
        emit(
          const UserAuthSignUpSuccess(),
        );
      },
    );
  }


  // este es el metodo para iniciar sesion

  Future<void> _onLogOutEvent(
    OnLogoutUserEvent event,
    Emitter<UserAuthState> emit,
  ) async {
    emit(UserAuthLoading());
    final result = await logOutUseCase(NoParams());

    result.fold(
      (failure) {
        customLog('❌ Error al cerrar seccion: ${failure.message}');
        emit(UserAuthFailure(failure.message));
      },
      (susses) {
        customLog(susses.toString());
        emit(
          UserAuthInitial(),
        );
      },
    );
  }
}
