import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'register_form_cubit_state.dart';

class RegisterFormCubit extends Cubit<RegisterFormCubitState> {

  RegisterFormCubit() : super(const RegisterFormCubitState());

  
  void updateFullName(String? fullName) {
    emit(state.copyWith(fullName: fullName));
  }
  
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
