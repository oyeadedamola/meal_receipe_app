import 'package:flutter/material.dart';
import '/items/main_drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  
  final List<Meal> FavouriteMeals;

  TabsScreen(this.FavouriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String,Object>> _pages;
  int _selectPageIndex = 0;

  @override
  void initState() {
    _pages = [
    {'page': CategoresScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(widget.FavouriteMeals), 'title': 'Your Favourite'}
  ];
    // TODO: implement initState
    super.initState();
  }

  void _selectPage(int index){
      setState(() {
         print(index);
        _selectPageIndex = index;
       
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title'] as String),
          ),
          drawer: MainnDrawer(),
      body: _pages[_selectPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourties'
            ),
        ]),
      );
  }
}
