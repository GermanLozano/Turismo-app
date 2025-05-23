import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turismo_app/src/core/config/config.dart';
import 'package:turismo_app/src/core/l10n/l10n.dart';
import 'package:turismo_app/src/core/router/router.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/individual_bloc/individual_bloc_management_bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/popular_individual_bloc/popular_individual_bloc_management_bloc.dart';
import 'package:turismo_app/src/features/user/presentation/bloc/user_auth/user_auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UserAuthBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<
              CategoryManagemenBloc>(), // <-- Aquí se dispara el evento al iniciar
        ),
        BlocProvider(
          create: (context) => sl<
              SubCategoryManagemenBloc>(), // <-- Aquí se dispara el evento al iniciar
        ),
          BlocProvider(
            create: (context) => sl<
                PopularIndividualBlocManagementBloc>(), // <-- Aquí se dispara el evento al iniciar
          ),
          BlocProvider(
            create: (context) => sl<
                IndividualBlocManagementBloc>(), // <-- Aquí se dispara el evento al iniciar
          ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ontologia Tusrismo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter,
    );
  }
}
