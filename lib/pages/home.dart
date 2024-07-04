import 'package:first_app/models/category_model.dart';
import 'package:first_app/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          popularSection(),
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

  Column popularSection() {
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
            return Padding(
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
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          popularItems[index].imagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
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
                          fontSize: 13, color: Color(0xffa1887f), height: 1.2),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
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
        height: 100,
        child: ListView.separated(
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              return Container(
                width: 200,
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
                      height: 35,
                      width: 35,
                      child: SvgPicture.asset(
                        categories[index].iconPath,
                        color: const Color(0xff8d6e63),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      categories[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Color(0xff8d6e63)),
                    )
                  ],
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
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    height: 10,
                    width: 10,
                  )),
              suffixIcon: Padding(
                  padding: const EdgeInsets.all(8),
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
      elevation: 0,
      centerTitle: true,
      leading: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
      actions: [
        GestureDetector(
            onTap: () {
              debugPrint('Menu Button');
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                'assets/icons/options.svg',
                height: 16,
                width: 16,
              ),
            ))
      ],
    );
  }
}
