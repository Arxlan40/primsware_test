import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primsware_test/app/modules/home/views/circle_button.dart';
import 'package:primsware_test/app/modules/home/views/round_button.dart';
import 'package:primsware_test/app/utils/colors.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  Map<String, List<String>> categorySubcategoryMap = {
    'Food': ['BreakFast', 'Lunch', 'Dinner', 'Drinks'],
    'Drinks': ['Pepse', 'Mirinda', "Coke"],
    'Places': [
      'Lahore',
      'Islamabad',
      'Karachi',
    ],
    'Products': ['Pepse', 'Mirinda', "Coke"],
    'Events': ['Pepse', 'Mirinda', "Coke"],
    'Stays': ['Pepse', 'Mirinda', "Coke"],
    'Homes': ['Pepse', 'Mirinda', "Coke"],
    'NightLife': ['Pepse', 'Mirinda', "Coke"],
  };

  List<String> selectedCategories = [];
  List<String> selectedSubcategories = [];

  @override
  void onInit() {
    super.onInit();
  }

  List<Widget> buildCategoryChips() {
    List<Widget> chips = [];
    for (var category in categorySubcategoryMap.keys) {
      bool isSelected = selectedCategories.contains(category);
      chips.add(
        InkWell(
            onTap: () {
              if (isSelected) {
                selectedCategories.remove(category);
                selectedCategories.removeWhere((subcategory) =>
                    categorySubcategoryMap[category]!.contains(subcategory));
              } else {
                selectedCategories.add(category);
              }
              update();
            },
            child: CircleButton(
              icon: Icons.ac_unit,
              title: category,
              color: isSelected ? AppColors.goldButtonColor : AppColors.white,
            )),
      );
    }
    return chips;
  }

  List<Widget> buildSubcategoryCheckboxes() {
    List<Widget> checkboxes = [];
    categorySubcategoryMap.keys.forEach((category) {
      if (selectedCategories.contains(category)) {
        categorySubcategoryMap[category]!.forEach((subcategory) {
          bool isSelected = selectedSubcategories.contains(subcategory);
          checkboxes.add(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    if (!isSelected) {
                      selectedSubcategories.add(subcategory);
                    } else {
                      selectedSubcategories.remove(subcategory);
                    }
                    update();
                  },
                  child: RoundButton(
                    icon: Icons.ac_unit,
                    selected: isSelected,
                    title: subcategory,
                    color: isSelected
                        ? AppColors.goldButtonColor
                        : AppColors.white,
                  ),
                )
              ],
            ),
          );
        });
      }
    });

    return checkboxes;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
