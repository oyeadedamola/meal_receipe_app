import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreeen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final toggleFavourite;
  final Function isFavourite;

  MealDetailScreeen(this.toggleFavourite, this.isFavourite);


Widget buildSectionTitle(BuildContext context, String text){
  return Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline6,),
              );
}

Widget BuildContainer(Widget child){
  return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: child
            );
}

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(title: Text(selectedMeal.title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
              ),
              buildSectionTitle(context, 'Ingredents'),
              BuildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context,'Steps'),
              BuildContainer(
                ListView.builder(
                  itemBuilder: ((context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('# ${(index + 1)}')),
                        title: Text(selectedMeal.steps[index]),
                      ),
                    Divider()],
                  )),
                  itemCount: selectedMeal.steps.length,
              ),)
        
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => toggleFavourite(mealId),
          child: Icon(isFavourite(mealId)? Icons.star : Icons.star_border,)
        ),
    );
  }
}
