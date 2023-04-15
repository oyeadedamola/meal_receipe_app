import 'package:flutter/material.dart';
import 'package:meal_receipe_app/dummy_data.dart';
import '../items/category_item.dart';


class CategoresScreen extends StatelessWidget {
  const CategoresScreen({super.key});

   

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(12),
      children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
            catData.id,
            catData.title, 
            catData.color,))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
    
  }
}
