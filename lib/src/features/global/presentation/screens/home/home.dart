import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turismo_app/src/core/constants/constants.dart';
import 'package:turismo_app/src/features/user/presentation/bloc/user_auth/user_auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Home Screen',
              style: AppTextStyle.header,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UserAuthBloc>().add(
                      const OnLogoutUserEvent(),
                    );
              },
              child: const Text('Cerrar sesion'),
            ),
          ],
        ),
      ),
    );
  }
}
