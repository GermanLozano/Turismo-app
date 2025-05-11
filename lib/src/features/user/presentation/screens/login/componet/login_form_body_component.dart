import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turismo_app/src/features/user/presentation/screens/login/componet/login_form_component.dart';

class LoginFormBodyComponent extends StatelessWidget {
  const LoginFormBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Container(
      
      decoration: BoxDecoration(
        color: scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(100),
        ),
      ),
      child: Column(
        children: [
          LoginFormComponent(),
          Padding(
            padding:  const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes cuenta?'),
                TextButton(
                  onPressed: () => context.push('/register'),
                  child: const Text('Crea una aquí'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
