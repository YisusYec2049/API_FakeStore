import 'package:api_products/Screen/Product_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(
          child: Column(
        children: [
          ProductPage(),
        ],
      )),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final bool selected;

  const CategoryItem({
    Key? key,
    required this.selected,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 250),
      height: 105,
      width: 78,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: selected
            ? Border.all(width: 2, color: Color.fromARGB(255, 158, 70, 158))
            : Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(4, 8))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 30,
                width: 46,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 6),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Container',
            style: GoogleFonts.roboto(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}
