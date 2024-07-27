import 'package:coffee_shop_app/models/category_model.dart';
import 'package:coffee_shop_app/models/popular_model.dart';
import 'package:coffee_shop_app/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<PopularModel> popularItems = [];

  void getCategories() {
    categories = CategoryModel.getCategories();
  }

  void getPopularItems() {
    popularItems = PopularModel.getPopularItems();
  }

  @override
  Widget build(BuildContext context) {
    getCategories();
    getPopularItems();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        children: [
          searchBar(),
          const SizedBox(
            height: 30,
          ),
          categoriesSection(),
          const SizedBox(
            height: 30,
          ),
          popularSection(context: context, popularItems: popularItems),
          const SizedBox(
            height: 15,
          ),
          footer()
        ],
      ),
    );
  }

  Container footer() {
    return Container(
      alignment: Alignment.center,
      height: 50,
      color: const Color(0xffefebe9),
      child: const Text(
        'Made by jpdoshi.',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Nunito'),
      ),
    );
  }

  Column categoriesSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'Shop by Category',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
      ),
      const SizedBox(height: 15),
      SizedBox(
        height: 65,
        child: ListView.separated(
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 500),
                    content: Text('${categories[index].title} clicked!',
                        style: const TextStyle(
                            color: Color(0xff4e342e),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    backgroundColor: Colors.white,
                  ));
                },
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xffefebe9).withOpacity(0.5),
                            const Color(0xffd7ccc8).withOpacity(0.5)
                          ]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(
                          categories[index].iconPath,
                          colorFilter: const ColorFilter.mode(
                              Color(0xff8d6e63), BlendMode.srcIn),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        categories[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Color(0xff8d6e63)),
                      )
                    ],
                  ),
                ),
              );
            }),
      )
    ]);
  }

  Container searchBar() {
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Find Coffee, Snacks and Deserts',
              hintStyle: const TextStyle(color: Color(0xffbcaaa4)),
              prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    height: 10,
                    width: 10,
                  )),
              suffixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/icons/filter.svg',
                    height: 10,
                    width: 10,
                  )),
              filled: true,
              fillColor: const Color(0xffefebe9).withOpacity(0.5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none)),
        ));
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'JD Coffee Shop',
        style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito'),
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            onPressed: () {
              debugPrint('Menu Button');
            },
            icon: SvgPicture.asset(
              'assets/icons/options.svg',
              height: 16,
              width: 16,
            ),
          ),
        )
      ],
    );
  }
}

// ignore: camel_case_types
class popularSection extends StatelessWidget {
  final BuildContext context;
  final List<PopularModel> popularItems;

  const popularSection(
      {super.key, required this.context, required this.popularItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Popular Items',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
        ),
        const SizedBox(height: 15),
        GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          primary: false,
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.25,
          children: List.generate(popularItems.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ItemPage(item: popularItems[index])));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffefebe9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 2))
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            popularItems[index].imagePath,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        popularItems[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Color(0xff4e342e)),
                      ),
                      Text(
                        popularItems[index].category,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xffa1887f),
                            height: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
