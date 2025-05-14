import 'package:flutter/material.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';

class CategoryDropwnButtomWidget extends StatelessWidget {
  const CategoryDropwnButtomWidget({
    required this.categoryItems,
    this.categoryValue,
    this.onChanged,
    super.key,
  });

  final CategoryEntity? categoryValue;
  final List<CategoryEntity> categoryItems;
  final void Function(CategoryEntity?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      height: 60,
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
          onChanged: onChanged,
          isExpanded: true,
          value: categoryValue,
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
          items: categoryItems.map(
            (CategoryEntity category) {
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
            },
          ).toList(),
        ),
      ),
    );
  }
}
