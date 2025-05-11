import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turismo_app/src/features/user/presentation/screens/register/componet/register_form_component.dart';

class RegisterFormBodyComponent extends StatelessWidget {
  const RegisterFormBodyComponent({super.key});

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
          RegisterFormComponent(),
          Padding(
            padding:  const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Ya tienes cuenta?'),
                TextButton(
                  onPressed: () {
                    if ( context.canPop()){
                      return context.pop();
                    }
                    context.go('/login');
                  },
                  child: const Text('Iniciar seseion'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
