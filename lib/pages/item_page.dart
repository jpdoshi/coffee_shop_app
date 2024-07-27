import 'package:coffee_shop_app/models/popular_model.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final PopularModel item;

  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Item',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito'),
        ),
        backgroundColor: const Color(0xffefebe9),
        surfaceTintColor: const Color(0xffefebe9),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
                onPressed: () {
                  debugPrint('Menu Button');
                },
                icon: const Icon(Icons.more_vert_rounded)),
          )
        ],
      ),
      backgroundColor: const Color(0xffefebe9),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
          children: [
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(item.imagePath, height: 250, width: 250)),
            ),
            const SizedBox(height: 20),
            Text(item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4e342e))),
            const SizedBox(height: 24),
            const Text('Description:',
                style: TextStyle(
                    color: Color(0xff4e342e),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(item.description,
                style: const TextStyle(
                    fontSize: 18, color: Color(0xffa1887f), height: 1.5)),
            const SizedBox(height: 25),
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text('Item Added to Cart!',
                          style: TextStyle(
                              color: Color(0xff4e342e),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      backgroundColor: Colors.white));
                },
                style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
                    backgroundColor: const WidgetStatePropertyAll(Colors.black),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)))),
                child: Text('Order ${item.title} for \$${item.price}',
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito')))
          ]),
    );
  }
}
