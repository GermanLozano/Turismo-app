// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'login_form_cubit.dart';

class LoginFormCubitState extends Equatable {
  const LoginFormCubitState({
    this.email = '',
    this.password = '',
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  final String email;
  final String password;
  final AutovalidateMode autovalidateMode;

  LoginFormCubitState copyWith({
    String? email,
    String? password,
    AutovalidateMode? autovalidateMode,
  }) {
    return LoginFormCubitState(
      email: email ?? this.email,
      password: password ?? this.password,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }

  @override
  List<Object> get props => [email, password, autovalidateMode];
}
