// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mealzy/widgets/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function savedFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.savedFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactosFree = false;
  var _vegetarian = false;
  var _vegan = false;

  Widget _buildListTileSwitch(String title, String description,
      bool currentValue, Function(bool)? updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactosFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(
                tooltip: 'Save ',
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactosFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.savedFilters(selectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildListTileSwitch(
                    'Gluten-Free',
                    'Only includes gluten-free meals',
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  _buildListTileSwitch(
                    'Lactos-Free',
                    'Only includes lactos-free meals',
                    _lactosFree,
                    (newValue) {
                      setState(() {
                        _lactosFree = newValue;
                      });
                    },
                  ),
                  _buildListTileSwitch(
                    'Vegetarian',
                    'Only includes vegetarian meals',
                    _vegetarian,
                    (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  _buildListTileSwitch(
                    'Vegan',
                    'Only includes vegan meals',
                    _vegan,
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          final selectedFilters = {
                            'gluten': _glutenFree,
                            'lactose': _lactosFree,
                            'vegan': _vegan,
                            'vegetarian': _vegetarian,
                          };
                          widget.savedFilters(selectedFilters);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.save),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Save Filters',
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
