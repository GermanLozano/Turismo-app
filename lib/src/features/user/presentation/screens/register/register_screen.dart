import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turismo_app/src/features/user/presentation/screens/register/componet/register_form_body_component.dart';
import 'package:turismo_app/src/features/user/presentation/screens/register/cubit/register_form_cubit.dart';
import 'package:turismo_app/src/features/user/presentation/widgets/banner_widget.dart';
import 'package:turismo_app/src/features/user/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => RegisterFormCubit(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: GeometricalBackground(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  BannerWidget(
                    widget: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (!context.canPop()) return;
                            context.pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Crear cuenta',
                          style: textStyles.titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                    height: MediaQuery.sizeOf(context).height * 0.3,
                  ),
                  const RegisterFormBodyComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
