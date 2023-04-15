import 'package:flutter/material.dart';
import '../items/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  
  static const routeName = '/filters';
  final Map<String,bool> currentfilters;
  final Function saveFilters;

  FiltersScreen(this.currentfilters,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {

    _glutenFree = widget.currentfilters['glutten'] ?? false;
    _lactoseFree = widget.currentfilters['lactose'] ?? false;
    _vegetarian= widget.currentfilters['vegetarian']?? false;
    _vegan = widget.currentfilters['vegan'] ?? false;
    // TODO: implement initState
    super.initState();
  }
  

  Widget _buildSwitchListTile(
    String title, 
    String description,
    bool currentValue, 
    Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue);
      }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filtered Meals'),
        actions: [
          IconButton(onPressed: () {
            final selectedFilters ={
             'glutten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);},
            icon: Icon(Icons.save),)
        ],),
        drawer: MainnDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      'Gluten-free',
                      "Only include Gluten-free meals",
                      _glutenFree, 
                      (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }
                  
                  ),
                  _buildSwitchListTile(
                      'Gluten-free',
                      "Only include Lactose-free meals",
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }
                  ),
                  _buildSwitchListTile(
                      'Vegetarian',
                      "Only include vegetarian meals",
                      _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }
                  ),
                  _buildSwitchListTile(
                      'Vegan',
                      "Only include Vegan meals",
                      _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    },);
                  }
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
