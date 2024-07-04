class PopularModel {
  String title;
  String category;
  String imagePath;

  PopularModel(
      {required this.title, required this.category, required this.imagePath});

  static List<PopularModel> getPopularItems() {
    List<PopularModel> popularItems = [];

    popularItems.add(PopularModel(
        title: 'Cappuccino',
        category: 'Coffee',
        imagePath: 'assets/images/cappuccino.jpg'));

    popularItems.add(PopularModel(
        title: 'Americano',
        category: 'Coffee',
        imagePath: 'assets/images/americano.jpg'));

    popularItems.add(PopularModel(
        title: 'Donut',
        category: 'Desserts',
        imagePath: 'assets/images/donut.jpg'));

    popularItems.add(PopularModel(
        title: 'Espresso Coffee',
        category: 'Coffee',
        imagePath: 'assets/images/espresso.jpg'));

    popularItems.add(PopularModel(
        title: 'Latte',
        category: 'Coffee',
        imagePath: 'assets/images/latte.jpg'));

    popularItems.add(PopularModel(
        title: 'Lemonade',
        category: 'Other Drinks',
        imagePath: 'assets/images/lemonade.jpg'));

    popularItems.add(PopularModel(
        title: 'Cafe Mocha',
        category: 'Coffee',
        imagePath: 'assets/images/mocha.webp'));

    popularItems.add(PopularModel(
        title: 'Orange Juice',
        category: 'Other Drinks',
        imagePath: 'assets/images/orange-juice.jpg'));

    return popularItems;
  }
}
