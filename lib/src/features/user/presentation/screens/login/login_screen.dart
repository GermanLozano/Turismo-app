import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turismo_app/src/features/global/presentation/widgets/geometrical_background.dart';
import 'package:turismo_app/src/features/user/presentation/screens/login/componet/login_form_body_component.dart';
import 'package:turismo_app/src/features/user/presentation/screens/login/cubit/login_form_cubit.dart';
import 'package:turismo_app/src/features/user/presentation/widgets/banner_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return BlocProvider(
      create: (_) => LoginFormCubit(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: GeometricalBackground(
            lengthRows: 10,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  // Banner
                  BannerWidget(
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                          size: 100,
                        ),
                        Text(
                          'Login',
                          style: textStyles.titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    height: MediaQuery.sizeOf(context).height * 0.5,
                  ),
                  // From
                  const LoginFormBodyComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
