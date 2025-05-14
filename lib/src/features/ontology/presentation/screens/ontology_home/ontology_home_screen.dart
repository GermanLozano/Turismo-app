import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/components/tab_bar_component.dart';
import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/components/tab_bar_view_component.dart';

class OntologyHome extends StatefulWidget {
  const OntologyHome({super.key});

  @override
  State<OntologyHome> createState() => _OntologyHomeState();
}

class _OntologyHomeState extends State<OntologyHome>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  
  @override
  void initState() {
    tabController =
              TabController(length: 3, vsync: this);
    super.initState();
  }
  
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryManagemenBloc, CategoryManagemenState>(
      listener: (context, state) {
        if (state is CategoryLoaded) {
          tabController =
              TabController(length: state.categories.length, vsync: this);
        }
      },
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBarComponent(tabController: tabController),
          ),
          body: TapBarViewComponenet(tabController: tabController),
        );
      },
    );
  }
}
