part of 'user_auth_bloc.dart';

sealed class UserAuthEvent extends Equatable {
  const UserAuthEvent();
}

// Evento para iniciar sesión (ya existente)
class OnGetUserEvent extends UserAuthEvent {
  const OnGetUserEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

// 🔐 Evento para registrar un nuevo usuario
class OnSignUpUserEvent extends UserAuthEvent {
  const OnSignUpUserEvent({
    required this.userEntity,
  });

  final UserEntity userEntity;

  @override
  List<Object?> get props => [userEntity];
}

// 🚪 Evento para cerrar sesión
class OnLogoutUserEvent extends UserAuthEvent {
  const OnLogoutUserEvent();

  @override
  List<Object?> get props => [];
}
