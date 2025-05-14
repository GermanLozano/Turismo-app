import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:turismo_app/src/features/global/presentation/widgets/custom_text_form_field.dart';
import 'package:turismo_app/src/features/global/presentation/widgets/geometrical_background.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/widgets/widgets.dart';
import 'package:turismo_app/src/features/user/presentation/bloc/bloc.dart';

class AppBarComponenet extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponenet({
    required this.tabController,
    super.key,
  });

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
      child: GeometricalBackground(
        lengthRows: 3,
        child: AppBar(
          title: const _CustomAppBarTitle(),
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          bottom: _CustomTabBar(tabController: tabController),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2.7);
}

class _CustomAppBarTitle extends StatelessWidget {
  const _CustomAppBarTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
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
              context.read<UserAuthBloc>().add(const OnLogoutUserEvent());
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomTabBar({
    this.tabController,
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
            onTap: (index) {
              context.read<CategoryManagemenBloc>().add(
                    SelectCategoryEvent(
                      category: state[index],
                    ),
                  );
            },
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
