import 'package:flutter/material.dart';
import '/screens/filters_screen.dart';

class MainnDrawer extends StatelessWidget {
  const MainnDrawer({super.key});

  Widget buildListTile(IconData icon, String title, VoidCallback tapHandler){
    return ListTile(
          leading: Icon(icon, size: 26,),
          title: Text(title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          ),
          onTap: tapHandler,

        );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(
      children: [
        Container(
          height: 75,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Colors.greenAccent,
          alignment: Alignment.centerLeft,
          child: Text('Cooking Up', style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 25,
            color: Theme.of(context).primaryColor
          ),),
        ),
        SizedBox(height: 20,),
        buildListTile(Icons.restaurant, 'Meals',
        () {
          Navigator.of(context).pushReplacementNamed('/');
        } ),
        buildListTile(Icons.settings, 'Filters',
        () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        } 
        ),
      ],
    ),

    );
  }
}