
part of 'register_form_cubit.dart';

 class RegisterFormCubitState extends Equatable {

  const RegisterFormCubitState({
    this.fullName = ' ',
    this.email = ' ',
    this.password = ' ',
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  final String fullName;
  final String email;
  final String password;
  //final Rol rol;
  final AutovalidateMode autovalidateMode;

  @override
  List<Object> get props => [fullName, email, password];

  RegisterFormCubitState copyWith({
    String? fullName,
    String? email,
    String? password,
    AutovalidateMode? autovalidateMode,
  }) {
    return RegisterFormCubitState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }


}
