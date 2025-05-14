import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/bloc.dart';

import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/widgets/widgets.dart';

class TabBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const TabBarComponent({
    this.tabController,
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
          return TabBar(
            controller: tabController,
            isScrollable: true,
            dividerColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicator: CircleTabIndicator(radius: 7, color: Colors.white),
            indicatorWeight: 20,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(fontSize: 18),
            splashFactory: InkSplash.splashFactory,
            splashBorderRadius: BorderRadius.circular(20),
            tabs: state
                .map((category) => Tab(text: category.normaliceName))
                .toList(),
          );
        }
        return const SizedBox();
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
