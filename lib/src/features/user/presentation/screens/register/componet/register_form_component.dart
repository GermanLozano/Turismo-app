import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turismo_app/src/core/mixings/validator.dart';
import 'package:turismo_app/src/features/user/domain/entities/user_entity.dart';
import 'package:turismo_app/src/features/user/presentation/bloc/bloc.dart';
import 'package:turismo_app/src/features/user/presentation/screens/register/cubit/register_form_cubit.dart';
import 'package:turismo_app/src/features/user/presentation/widgets/widgets.dart';

class RegisterFormComponent extends StatelessWidget with Validator {
  RegisterFormComponent({super.key});

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    
    final registerFormCubit = context.read<RegisterFormCubit>();
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70),
            child: Text('Crear Cuenta', style: textStyles.titleLarge),
          ),

          BlocBuilder<RegisterFormCubit, RegisterFormCubitState>(
            builder: (context, state) {
              return Form(
                key: formKey,
                autovalidateMode: state.autovalidateMode,
                child: Column(
                  spacing: 20,
                  children: [
                    CustomTextFormField(
                      label: 'Nombre completo',
                      validator: validateName,
                      onChanged: registerFormCubit.updateFullName,
                    ),
                    CustomTextFormField(
                      label: 'Correo',
                      validator: validateEmail,
                      onChanged: registerFormCubit.updateEmail,
                    ),

                    CustomTextFormField(
                      label: 'Contraseña',
                      obscureText: true,
                      validator: validatePassword,
                      onChanged: registerFormCubit.updatePassword,
                    ),

                    CustomTextFormField(
                      label: 'Confirma Contraseña',
                      obscureText: true,
                      validator: (value) => validateConfirmPassword(value, registerFormCubit.state.password),
                      onChanged: registerFormCubit.updatePassword,
                      onFieldSubmitted: (_) {
                        _onFormSubmit(context, registerFormCubit);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: BlocConsumer<UserAuthBloc, UserAuthState>(
              listener: (context, state) {
                if (state is UserAuthFailure) {
                  showSnackbar(context, state.message);
                }
              },
              builder: (context, state) {
                final isLoading = state is UserAuthLoading;
                return CustomFilledButton(
                  text: 'Registrar',
                  buttonColor: Colors.black,
                  onPressed: () => _onFormSubmit(context, registerFormCubit),
                  child: isLoading ? const CircularProgressIndicator() : null,
                );
              },
            ),
          ),

        
        ],
      ),
    );
  }


  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }


  void _onFormSubmit(BuildContext context, RegisterFormCubit registerFormCubit) {
    if (formKey.currentState!.validate()) {
      context.read<UserAuthBloc>().add(
            OnSignUpUserEvent(
              userEntity: UserEntity(
                id: ' ', fullName: 
                registerFormCubit.state.fullName, 
                email: registerFormCubit.state.email, 
                password: registerFormCubit.state.password,
                ),
            ),
          );
    } else {
      context.read<RegisterFormCubit>().updateAutovalidateMode(AutovalidateMode.always);
      showSnackbar(context, 'Campos incompletos');
    }
  }
}
