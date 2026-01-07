import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final Function(String) onSelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: categories.map((c) {
        final bool active = c == selected;

        return GestureDetector(
          onTap: () => onSelected(c),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              color: active ? Colors.white : Colors.brown.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              c,
              style: TextStyle(
                color: active ? Colors.brown : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
