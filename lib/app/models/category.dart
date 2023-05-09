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
