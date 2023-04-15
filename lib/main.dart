import 'package:flutter/material.dart';
import '/dummy_data.dart';
import '/screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import '/screens/category_meals_screen.dart';
import '/screens/meal_detail_screen.dart';
import 'models/meal.dart';



void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
 
  List<Meal>? _availableMeals = DUMMY_MEALS;
  List<Meal> _favouritedMeals = [];

  void _setFilters(Map<String, bool> filterData){
  setState(() {
    _filters = filterData;
    

   _availableMeals = DUMMY_MEALS.where((meal) {
     if (_filters['glutten']! && !meal.isGlutenFree) {
      return false;
    }
     if (_filters['lactose']! && !meal.isLactoseFree) {
      return false;
    }
     if (_filters['vegan']! && !meal.isVegan) {
      return false;
    }
     if (_filters['vegetarian']! && !meal.isVegetarian) {
      return false;
    }
    return true;
   }).toList();
  });
  }

  // ignore: body_might_complete_normally_nullable
  void _toggleFavourite(String mealId){
    final existingIndex = _favouritedMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favouritedMeals.removeAt(existingIndex);
      });
      } else{
        setState(() {
          _favouritedMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        });
      }
    }
  bool  _isMealFavourite(String id) {
    return _favouritedMeals.any((meal) => meal.id == id);

  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreen,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
          
        )
      ),
      home: TabsScreen(_favouritedMeals),
      routes: {
        CategoryMealScreen.routeName:(context) => CategoryMealScreen(_availableMeals!),
        MealDetailScreeen.routeName:(context) => MealDetailScreeen(_toggleFavourite, _isMealFavourite),
        FiltersScreen.routeName:(context) => FiltersScreen(_filters,_setFilters),
      },
    );
  }
}

