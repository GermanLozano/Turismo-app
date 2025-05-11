import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turismo_app/src/core/animations/router_aniamtion.dart';
import 'package:turismo_app/src/core/config/config.dart';
import 'package:turismo_app/src/features/global/presentation/screens/home/home.dart';
import 'package:turismo_app/src/features/user/presentation/bloc/user_auth/user_auth_bloc.dart';
import 'package:turismo_app/src/features/user/presentation/screens/login/login_screen.dart';
import 'package:turismo_app/src/features/user/presentation/screens/register/register_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) => routerAniamtion(
        context: context,
        page: const LoginScreen(),
        tipeAnimation: RouterTipeAnimation.fade,
      ),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      pageBuilder: (context, state) => routerAniamtion(
        context: context,
        page: const RegisterScreen(),
        tipeAnimation: RouterTipeAnimation.fade,
      ),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) => routerAniamtion(
        context: context,
        page: const HomeScreen(),
        tipeAnimation: RouterTipeAnimation.fade,
      ),
    ),
  ],
  redirect: (context, state) {
    final userAuthBloc = context.read<UserAuthBloc>();

    customLog('=======> ${userAuthBloc.state}');

    final userAuthState = userAuthBloc.state is UserAuthLoaded;

    final authRoutes = ['/login', '/register'];

    if (!userAuthState && authRoutes.contains(state.matchedLocation)) {
      return null;
    }

    if (!userAuthState && !authRoutes.contains(state.matchedLocation)) {
      return '/login';
    }

  

    return null;
  },
);
