import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/sub_category_managemen/sub_category_managemen_bloc.dart';

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
    context
        .read<SubCategoryManagemenBloc>()
        .add(SubGetSubCategoriesEvent(category: widget.category));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<SubCategoryManagemenBloc, SubCategoryManagemenState>(
        builder: (context, state) {
          switch (state) {
            case SubCategoryInitial():
            case SubCategoryLoading():
            case SubCategoryError():
              return const SizedBox();

            case SubCategoryLoaded():
              if (state.categories.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<CategoryEntity>(
                          onChanged: (value) {
                            context
                                .read<SubCategoryManagemenBloc>()
                                .categorySeleted(value);
                          },
                          isExpanded: true,
                          value: state.categorySeleted,
                          icon: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.grey.shade600,
                          ),
                          hint: const Text('Seleceted Subcategory'),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          items:
                              state.categories.map((CategoryEntity category) {
                            return DropdownMenuItem<CategoryEntity>(
                              value: category,
                              child: Text(
                                category.normaliceName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
          }
        },
      ),
    );
  }
}
