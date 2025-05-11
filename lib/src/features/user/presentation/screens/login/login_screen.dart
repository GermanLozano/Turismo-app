import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turismo_app/src/features/user/presentation/screens/login/componet/login_form_body_component.dart';
import 'package:turismo_app/src/features/user/presentation/screens/login/cubit/login_form_cubit.dart';
import 'package:turismo_app/src/features/user/presentation/widgets/banner_widget.dart';
import 'package:turismo_app/src/features/user/presentation/widgets/geometrical_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormCubit(),
      child:  Scaffold(
        body: GeometricalBackground(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                // Banner
                BannerWidget(
                  widget: const Icon(
                    Icons.place_outlined,
                    color: Colors.white,
                    size: 100,
                  ),
                  height: MediaQuery.sizeOf(context).height*0.5,
                
                ),
                // From
                const LoginFormBodyComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
