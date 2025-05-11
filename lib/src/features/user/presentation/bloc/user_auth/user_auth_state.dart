part of 'user_auth_bloc.dart';

sealed class UserAuthState extends Equatable {
  const UserAuthState();

  @override
  List<Object> get props => [];
}

// Estado inicial
final class UserAuthInitial extends UserAuthState {}

// Estado de carga (puede usarse tanto para login como para registro)
final class UserAuthLoading extends UserAuthState {}

// Estado cuando el usuario ha iniciado sesión correctamente
final class UserAuthLoaded extends UserAuthState {
  const UserAuthLoaded(this.userEntity);
  final UserEntity userEntity;

  @override
  List<Object> get props => [userEntity];
}

// ✅ Estado cuando el registro fue exitoso
final class UserAuthSignUpSuccess extends UserAuthState {
  const UserAuthSignUpSuccess({required this.message});
  final String message;

  @override
  List<Object> get props => [];
}

// Estado cuando falla login o registro
final class UserAuthFailure extends UserAuthState {
  const UserAuthFailure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
