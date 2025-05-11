import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_form_cubit_state.dart';

class LoginFormCubit extends Cubit<LoginFormCubitState> {

  LoginFormCubit() : super(const LoginFormCubitState());

  void updateEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String? password) {
    emit(state.copyWith(password: password));
  }

 void updateAutovalidateMode(AutovalidateMode? autovalidateMode) {
    emit(state.copyWith(autovalidateMode: autovalidateMode));
  }

}
