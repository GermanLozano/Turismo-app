import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turismo_app/src/core/mixings/validator.dart';
import 'package:turismo_app/src/features/user/presentation/bloc/bloc.dart';
import 'package:turismo_app/src/features/user/presentation/screens/login/cubit/login_form_cubit.dart';
import 'package:turismo_app/src/features/user/presentation/widgets/widgets.dart';

class LoginFormComponent extends StatelessWidget with Validator {
  LoginFormComponent({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginFormCubit = context.read<LoginFormCubit>();
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70),
            child: Text('Login', style: textStyles.titleLarge),
          ),
          BlocBuilder<LoginFormCubit, LoginFormCubitState>(
            builder: (context, state) {
              return Form(
                key: formKey,
                autovalidateMode: state.autovalidateMode,
                child: Column(
                  children: [
                    CustomTextFormField(
                      label: 'Correo',
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      onChanged: loginFormCubit.updateEmail,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      label: 'Contraseña',
                      obscureText: true,
                      validator: validatePassword,
                      onChanged: loginFormCubit.updatePassword,
                      onFieldSubmitted: (_) {
                        _onFormSubmit(context, loginFormCubit);
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
                  text: 'Ingresar',
                  buttonColor: Colors.black,
                  onPressed: isLoading
                      ? null
                      : () => _onFormSubmit(context, loginFormCubit),
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
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _onFormSubmit(BuildContext context, LoginFormCubit loginFormCubit) {
    if (formKey.currentState!.validate()) {
      context.read<UserAuthBloc>().add(
            OnGetUserEvent(
              email: loginFormCubit.state.email,
              password: loginFormCubit.state.password,
            ),
          );

      context.pushNamed('home');
    } else {
      context
          .read<LoginFormCubit>()
          .updateAutovalidateMode(AutovalidateMode.always);
      showSnackbar(context, 'Campos incompletos');
    }
  }
}
