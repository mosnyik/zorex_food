import 'package:flutter/material.dart';
import 'package:zorex_food/scr/helpers/commons.dart';
import 'package:zorex_food/scr/models/category.dart';

import 'custom_text.dart';

List<Category> categoryList = [
  Category(
    name: 'Burger',
    image: 'burger.jpg',
  ),
  Category(
    name: 'meat',
    image: 'suya.jpg',
  ),
  Category(
    name: 'Pizza',
    image: 'pizza.jpg',
  ),
  Category(
    name: 'Coffee',
    image: 'coffee_image_1.jpg',
  ),
  Category(
    name: 'Rice',
    image: 'jellof.jpg',
  ),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: white, boxShadow: [
                    BoxShadow(
                        color: Colors.amber[100],
                        offset: Offset(4, 6),
                        blurRadius: 20)
                  ]),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'images/${categoryList[index].image}',
                        height: 60,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: categoryList[index].name,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
