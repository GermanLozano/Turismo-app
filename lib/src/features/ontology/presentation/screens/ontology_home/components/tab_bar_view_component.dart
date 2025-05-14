import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/components/body_tap_bar_view_.dart';

class TapBarViewComponenet extends StatelessWidget {
  const TapBarViewComponenet({
    required this.tabController,
    super.key,
  });

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CategoryManagemenBloc, CategoryManagemenState,
        List<CategoryEntity>>(
      selector: (state) {
        return state is CategoryLoaded ? state.categories : [];
      },
      builder: (context, state) {
        if (tabController != null) {
          return TabBarView(
            controller: tabController,
            children: state.map((category) {
              return BodyTabBarView(
                category: category,
              );
            }).toList(),
          );
        }

        return const SizedBox();
      },
    );
  }
}
