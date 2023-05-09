import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:primsware_test/app/utils/colors.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
     MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: "PrismWare App",
          theme: ThemeData(
            primaryColor: AppColors.black,
            secondaryHeaderColor: AppColors.white,
            splashColor: AppColors.white,
          ),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  Map<String, List<String>> _categorySubcategoryMap = {
    'Category 1': ['Subcategory 1.1', 'Subcategory 1.2', 'Subcategory 1.3'],
    'Category 2': ['Subcategory 2.1', 'Subcategory 2.2'],
    'Category 3': ['Subcategory 3.1', 'Subcategory 3.2', 'Subcategory 3.3', 'Subcategory 3.4'],
  };

  List<String> _selectedCategories = [];
  List<String> _selectedSubcategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories and Subcategories'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: _buildCategoryChips(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Subcategories',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: _buildSubcategoryCheckboxes(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCategoryChips() {
    List<Widget> chips = [];

    _categorySubcategoryMap.keys.forEach((category) {
      bool isSelected = _selectedCategories.contains(category);
      chips.add(
        InkWell(
          onTap: () {
            setState(() {
              if (isSelected) {
                _selectedCategories.remove(category);
                _selectedSubcategories.removeWhere((subcategory) =>
                    _categorySubcategoryMap[category]!.contains(subcategory));
              } else {
                _selectedCategories.add(category);
              }
            });
          },
          child: Chip(
            backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
            label: Text(category),
          ),
        ),
      );
    });

    return chips;
  }

  List<Widget> _buildSubcategoryCheckboxes() {
    List<Widget> checkboxes = [];

    _categorySubcategoryMap.keys.forEach((category) {
      if (_selectedCategories.contains(category)) {
        _categorySubcategoryMap[category]!.forEach((subcategory) {
          bool isSelected = _selectedSubcategories.contains(subcategory);
          checkboxes.add(
            CheckboxListTile(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  if (value!) {
                    _selectedSubcategories.add(subcategory);
                  } else {
                    _selectedSubcategories.remove(subcategory);
                  }
                });
              },
              title: Text(subcategory),
            ),
          );
        });
      }
    });

    return checkboxes;
  }
}



class Category {
  final String name;
  final List<Subcategory> subcategories;

  Category(this.name, this.subcategories);
}

class Subcategory {
  final String name;
  bool selected;

  Subcategory(this.name, {this.selected = false});
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final categories = [    Category('Category 1', [      Subcategory('Subcategory 1.1'),      Subcategory('Subcategory 1.2'),      Subcategory('Subcategory 1.3'),    ]),
    Category('Category 2', [
      Subcategory('Subcategory 2.1'),
      Subcategory('Subcategory 2.2'),
      Subcategory('Subcategory 2.3'),
    ]),
    Category('Category 3', [
      Subcategory('Subcategory 3.1'),
      Subcategory('Subcategory 3.2'),
      Subcategory('Subcategory 3.3'),
    ]),
  ];

  List<Subcategory> _selectedSubcategories = [];

  void _toggleSubcategorySelection(Subcategory subcategory) {
    setState(() {
      subcategory.selected = !subcategory.selected;
      if (subcategory.selected) {
        _selectedSubcategories.add(subcategory);
      } else {
        _selectedSubcategories.remove(subcategory);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable Containers'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text(
                        category.name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Column(
                      children: category.subcategories
                          .map((subcategory) => GestureDetector(
                        onTap: () => _toggleSubcategorySelection(subcategory),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: subcategory.selected ? Colors.blue : Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                subcategory.name,
                                style: TextStyle(fontSize: 16),
                              ),
                              if (subcategory.selected) Icon(Icons.check, color: Colors.blue),
                            ],
                          ),
                        ),
                      ))
                          .toList(),
                    ),
                  ],
                );
              },
            ),
          ),
          if (_selectedSubcategories.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Text(
                'Selected Subcategories: ${_selectedSubcategories.map((e) => e.name).join(', ')}',
                style: TextStyle(fontSize: 18),
              ),
            ),
        ],
      ),
    );
  }
}
