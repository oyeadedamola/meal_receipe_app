import 'package:flutter/material.dart';
import 'package:meal_receipe_app/items/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> _availableMeals;

  CategoryMealScreen(this._availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  
    late String categoryTitle;
    late List<Meal> categoryMeals;
    bool _loadedInitdata =false;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitdata){
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    categoryMeals = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitdata = true;
    super.didChangeDependencies();
    }
  }

  void _removeMeal(String mealId) {
      setState(() {
        categoryMeals.removeWhere((meal) => meal.id == mealId);
      });
  }
  // final String CategoryId;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              duration: categoryMeals[index].duration,
              );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
