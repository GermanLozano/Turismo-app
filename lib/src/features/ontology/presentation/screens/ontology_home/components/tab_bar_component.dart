import 'package:flutter/material.dart';

import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/widgets/widgets.dart';

class TabBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const TabBarComponent({
    required this.tabController, super.key,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      dividerColor: Colors.transparent,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      indicator: CircleTabIndicator(radius: 7, color: Colors.blue),
      indicatorWeight: 20,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
      unselectedLabelStyle: const TextStyle(fontSize: 18),
      splashFactory: InkSplash.splashFactory,
      splashBorderRadius: BorderRadius.circular(20),
      tabs: const [
        Tab(
          text: 'Movie',
        ),
        Tab(
          text: 'Series ',
        ),
        Tab(
          text: 'TV Shows',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
