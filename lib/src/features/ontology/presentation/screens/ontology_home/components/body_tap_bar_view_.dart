import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/popular_individual_bloc/popular_individual_bloc_management_bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/sub_category_managemen/sub_category_managemen_bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/screens/ontology_home/widgets/category_dropwn_buttom_widget.dart';

class BodyTabBarView extends StatefulWidget {
  const BodyTabBarView({
    required this.category,
    super.key,
  });

  final CategoryEntity category;

  @override
  State<BodyTabBarView> createState() => _BodyTabBarViewState();
}

class _BodyTabBarViewState extends State<BodyTabBarView> {
  @override
  void initState() {
    super.initState();
    context
        .read<SubCategoryManagemenBloc>()
        .add(GetSubSubCategoriesEvent(category: widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 10,
      children: [SizedBox(), _CustomDropdownButton(), _BuildCarouseSlider()],
    );
  }
}

class _CustomDropdownButton extends StatelessWidget {
  const _CustomDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryManagemenBloc, SubCategoryManagemenState>(
      builder: (context, state) {
        switch (state) {
          case SubCategoryInitial():
          case SubCategoryLoading():
          case SubCategoryError():
            return const SizedBox();
          case SubCategoryLoaded():
            if (state.categories.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CategoryDropwnButtomWidget(
                  categoryItems: state.categories,
                  categoryValue: state.categorySeleted,
                  onChanged: (value) {
                    context
                        .read<SubCategoryManagemenBloc>()
                        .categorySeleted(value);
                  },
                ),
              );
            }
            return const SizedBox();
        }
      },
    );
  }
}

class _BuildCarouseSlider extends StatefulWidget {
  const _BuildCarouseSlider();

  @override
  State<_BuildCarouseSlider> createState() => _BuildCarouseSliderState();
}

class _BuildCarouseSliderState extends State<_BuildCarouseSlider>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<PopularIndividualBlocManagementBloc,
        PopularIndividualBlocManagementState>(
      builder: (context, state) {
        switch (state) {
          case PopularIndividualBlocManagementInitial():
          case PopularIndividualBlocManagementLoading():
          case PopularIndividualBlocManagementError():
            return const SizedBox();

          case PopularIndividualBlocManagementLoaded():
            if (state.individuals.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomCarouselWidget(
                  individuals: state.individuals,
                ),
              );
            }
            return const SizedBox();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomCarouselWidget extends StatefulWidget {
  const CustomCarouselWidget({required this.individuals, super.key});

  final List<IndividualEntity> individuals;

  @override
  State<CustomCarouselWidget> createState() => _CustomCarouselWidgetState();
}

class _CustomCarouselWidgetState extends State<CustomCarouselWidget> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.individuals.map((value) {
        return SizedBox.expand(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              value.imageURL,
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
      carouselController: _controller,
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 8),
        enlargeCenterPage: true,
      ),
    );
  }
}
