class PopularModel {
  String title;
  String category;
  String imagePath;
  String description;
  double price;

  PopularModel(
      {required this.title,
      required this.category,
      required this.imagePath,
      required this.description,
      required this.price});

  static List<PopularModel> getPopularItems() {
    List<PopularModel> popularItems = [];

    popularItems.add(PopularModel(
        title: 'Cappuccino',
        category: 'Coffee',
        imagePath: 'assets/images/cappuccino.jpg',
        description:
            'Cappuccino is an espresso-based coffee drink that is traditionally prepared with steamed milk including a layer of milk foam. Variations of the drink involve the use of cream instead of milk, using non-dairy milk substitutes and flavoring with cocoa powder (in Europe and Australasia) or cinnamon (in the United States).\n\nIt is typically smaller in volume than that of caffè latte, and topped with a thick layer of foam rather than being made with microfoam.',
        price: 10));

    popularItems.add(PopularModel(
        title: 'Americano',
        category: 'Coffee',
        imagePath: 'assets/images/americano.jpg',
        description:
            'Caffè americano, also known as americano or American, is a type of coffee drink prepared by diluting an espresso shot with hot water at a 1:3 to 1:4 ratio, resulting in a drink that retains the complex flavors of espresso, but in a lighter way. Its strength varies with the number of shots of espresso and the amount of water added. The name is also spelled with varying capitalization and use of diacritics: e.g., "café americano".\n\nIn Italy, caffè americano may mean either espresso with hot water or long-filtered coffee, but the latter is more precisely called caffè all americana(American-style coffee).',
        price: 8.50));

    popularItems.add(PopularModel(
        title: 'Donut',
        category: 'Desserts',
        imagePath: 'assets/images/donut.jpg',
        description:
            'A doughnut or donut is a type of pastry made from leavened fried dough. It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in bakeries, supermarkets, food stalls, and franchised specialty vendors. Doughnut is the traditional spelling, while donut is the simplified version; the terms are used interchangeably.',
        price: 7.65));

    popularItems.add(PopularModel(
        title: 'Espresso Coffee',
        category: 'Coffee',
        imagePath: 'assets/images/espresso.jpg',
        description:
            'Espresso is a concentrated form of coffee produced by forcing hot water under high pressure through finely-ground coffee beans. Originating in Italy, espresso has become one of the most popular coffee-brewing methods worldwide. It is characterized by its small serving size, typically 25-30 ml, and its distinctive layers: a dark body topped with a lighter-colored foam called crema.',
        price: 7.25));

    popularItems.add(PopularModel(
        title: 'Latte',
        category: 'Coffee',
        imagePath: 'assets/images/latte.jpg',
        description:
            'Caffè latte, often shortened to just latte in English, is a coffee drink of Italian origin made with espresso and steamed milk, traditionally served in a glass.\n\nVariants include the chocolate-flavored mocha or replacing the coffee with another beverage base such as masala chai (spiced Indian tea), mate, matcha, turmeric or rooibos; alternatives to milk, such as soy milk, almond milk or oat milk, are also used.',
        price: 8.40));

    popularItems.add(PopularModel(
        title: 'Lemonade',
        category: 'Other Drinks',
        imagePath: 'assets/images/lemonade.jpg',
        description:
            'Lemonade is a sweetened lemon-flavored drink. There are varieties of lemonade found throughout the world. In North America and South Asia, cloudy lemonade is a common variety.\n\nIt is traditionally a homemade drink using lemon juice, water, and a sweetener such as cane sugar, simple syrup, maple syrup or honey.In the United Kingdom, Ireland, Central Europe, South Africa, Australia, and New Zealand, a carbonated lemonade soft drink is more common.',
        price: 4.60));

    popularItems.add(PopularModel(
        title: 'Cafe Mocha',
        category: 'Coffee',
        imagePath: 'assets/images/mocha.webp',
        description:
            'A caffè mocha, also called mocaccino, is a chocolate-flavoured warm beverage that is a variant of a caffè latte, commonly served in a glass rather than a mug. Other commonly used spellings are mochaccino and also mochachino. The name is derived from the city of Mokha, Taiz Governorate, Yemen, which was one of the centres of early coffee trade. Like latte, the name is commonly shortened to just mocha.',
        price: 9.30));

    popularItems.add(PopularModel(
        title: 'Orange Juice',
        category: 'Other Drinks',
        imagePath: 'assets/images/orange-juice.jpg',
        description:
            'Orange juice is a liquid extract of the orange tree fruit, produced by squeezing or reaming oranges.\n\nIt comes in several different varieties, including blood orange, navel oranges, valencia orange, clementine, and tangerine. As well as variations in oranges used, some varieties include differing amounts of juice vesicles, known as "pulp" in American English, and "(juicy) bits" in British English. These vesicles contain the juice of the orange and can be left in or removed during the manufacturing process. How juicy these vesicles are depend upon many factors, such as species, variety, and season. In American English, the beverage name is often abbreviated as "OJ".',
        price: 6.75));

    return popularItems;
  }
}
