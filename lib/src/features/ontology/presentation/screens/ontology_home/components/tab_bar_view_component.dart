import 'package:flutter/material.dart';

import 'components.dart';

class TapBarViewComponenet extends StatelessWidget {
  const TapBarViewComponenet({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        // MovieViewComponent(),
        // SizedBox.expand(),
        // SizedBox.expand(),
        // SizedBox.expand(),
        // SizedBox.expand(),
        // SizedBox.expand(),
      ],
    );
  }
}
