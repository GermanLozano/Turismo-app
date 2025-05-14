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
    return Column(
      spacing: 10,
      children: [
        const SizedBox(),
        const _CustomDropdownButton(),
        const _BuildCarouseSlider(),
        SizedBox(),
        Expanded(
          child: BlocBuilder<PopularIndividualBlocManagementBloc,
              PopularIndividualBlocManagementState>(
            builder: (context, state) {
              switch (state) {
                case PopularIndividualBlocManagementInitial():
                case PopularIndividualBlocManagementLoading():
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );

                case PopularIndividualBlocManagementError():
                  return const SizedBox();

                case PopularIndividualBlocManagementLoaded():
                  if (state.individuals.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final individual = state.individuals[index];
                          return ListTile(
                            title: Text(individual.name),
                            subtitle: Text(individual.address),
                            leading: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    state.individuals[index].imageURL,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: state.individuals.length,
                      ),
                    );
                  }
                  return const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}

class _CustomDropdownButton extends StatelessWidget {
  const _CustomDropdownButton();
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
                        .add(SelectSubCategoryEvent(category: value));
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
        const double height = 200;
        switch (state) {
          case PopularIndividualBlocManagementInitial():
          case PopularIndividualBlocManagementLoading():
            return const SizedBox(
              height: height,
              child: Center(child: CircularProgressIndicator.adaptive()),
            );

          case PopularIndividualBlocManagementError():
            return const SizedBox();

          case PopularIndividualBlocManagementLoaded():
            if (state.individuals.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomCarouselWidget(
                  height: height,
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
  const CustomCarouselWidget({
    required this.individuals,
    required this.height,
    super.key,
  });

  final List<IndividualEntity> individuals;
  final double height;

  @override
  State<CustomCarouselWidget> createState() => _CustomCarouselWidgetState();
}

class _CustomCarouselWidgetState extends State<CustomCarouselWidget> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.individuals.map((value) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                value.imageURL,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black54,
                      Colors.black87,
                    ],
                    stops: [0.3, 0.8, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      value.type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70, // Color del brillo
                        blurRadius: 40,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 120,
                        color: Colors.black,
                      ),
                      Center(
                        child: Text(
                          value.valoration,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
      carouselController: _controller,
      options: CarouselOptions(
        height: widget.height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 10),
        enlargeCenterPage: true,
      ),
    );
  }
}
