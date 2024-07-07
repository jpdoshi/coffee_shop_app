class CategoryModel {
  String title;
  String iconPath;

  CategoryModel({required this.title, required this.iconPath});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
        CategoryModel(title: 'Coffee', iconPath: 'assets/icons/coffee.svg'));

    categories.add(
        CategoryModel(title: 'Snacks', iconPath: 'assets/icons/snacks.svg'));

    categories.add(CategoryModel(
        title: 'Desserts', iconPath: 'assets/icons/desserts.svg'));

    categories
        .add(CategoryModel(title: 'Tea', iconPath: 'assets/icons/coffee.svg'));

    categories.add(
        CategoryModel(title: 'Juices', iconPath: 'assets/icons/juices.svg'));

    return categories;
  }
}
