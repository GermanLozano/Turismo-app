import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/popular_individual_bloc/popular_individual_bloc_management_bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/components/app_bar_component.dart';
import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/components/tab_bar_view_component.dart';

class OntologyHome extends StatefulWidget {
  const OntologyHome({super.key});

  @override
  State<OntologyHome> createState() => _OntologyHomeState();
}

class _OntologyHomeState extends State<OntologyHome>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    context.read<CategoryManagemenBloc>().add(
          GetCategoriesEvent(),
        );
    context
        .read<PopularIndividualBlocManagementBloc>()
        .add(GetPopularIndividualEvent());
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CategoryManagemenBloc, CategoryManagemenState>(
        listener: (context, state) {
          if (state is CategoryLoaded && tabController == null) {
            tabController = TabController(
              length: state.categories.length,
              vsync: this,
            );
          }
        },
        builder: (context, state) {
          switch (state) {
            case CategoryInitial():
            case CategoryLoading():
              return const Center(child: CircularProgressIndicator());
            case CategoryLoaded():
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBarComponenet(tabController: tabController),
                body: TapBarViewComponenet(tabController: tabController),
              );
            case CategoryError():
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 100,
                    ),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
