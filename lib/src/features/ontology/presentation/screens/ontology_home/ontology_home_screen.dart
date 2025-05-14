import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/components/tab_bar_component.dart';
import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/components/tab_bar_view_component.dart';
import 'package:turismo_app/src/features/user/presentation/bloc/bloc.dart';
import 'package:turismo_app/src/features/user/presentation/widgets/widgets.dart';

class OntologyHome extends StatefulWidget {
  const OntologyHome({super.key});

  @override
  State<OntologyHome> createState() => _OntologyHomeState();
}

class _OntologyHomeState extends State<OntologyHome>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    context.read<CategoryManagemenBloc>().add(GetCategoriesEvent());
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
          if (state is CategoryLoaded) {
            tabController =
                TabController(length: state.categories.length, vsync: this);
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
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight * 2.7),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                    child: GeometricalBackground(
                      lengthRows: 3,
                      child: AppBar(
                        title: Row(
                          children: [
                            const Flexible(
                              child: CustomTextFormField(
                                hintText: 'Search Entity',
                              ),
                            ),
                            BlocListener<UserAuthBloc, UserAuthState>(
                              listener: (context, state) {
                                if (state is UserAuthInitial) {
                                  context.go('/login');
                                }
                              },
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<UserAuthBloc>()
                                      .add(const OnLogoutUserEvent());
                                },
                                icon: const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30),
                          ),
                        ),
                        bottom: TabBarComponent(tabController: tabController),
                      ),
                    ),
                  ),
                ),
                body: TapBarViewComponenet(tabController: tabController),
              );
            case CategoryError():
              return Center(
                child: Text(state.message),
              );
          }
        },
      ),
    );
  }
}
