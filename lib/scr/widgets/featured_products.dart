import 'package:flutter/material.dart';
import 'package:zorex_food/scr/helpers/commons.dart';
import 'package:zorex_food/scr/helpers/screen_navigation.dart';
import 'package:zorex_food/scr/models/products.dart';
import 'package:zorex_food/scr/screens/details.dart';

import 'custom_text.dart';

List<Product> productsList = [
  Product(
      name: 'Coffee',
      category: 'Breakfast',
      image: 'coffee_image_1.jpg',
      price: 1200,
      rating: 4.2,
      vendor: 'Chicken Republic',
      wishList: true),
  Product(
      name: 'Burger',
      category: 'Burger & Sandwishes',
      image: 'burger.jpg',
      price: 2500,
      rating: 4.2,
      vendor: 'Chicken Republic',
      wishList: true),
  Product(
      name: 'Jellof Rice',
      category: 'Rice & Sauce',
      image: 'jellof.jpg',
      price: 2800,
      rating: 4.2,
      vendor: 'Chicken Republic',
      wishList: false),
  Product(
      name: 'Pizza',
      category: 'Pasta & Noodles',
      image: 'pizza.jpg',
      price: 3200,
      rating: 4.2,
      vendor: 'Chicken Republic',
      wishList: true),
  Product(
      name: 'Suya',
      category: 'Meat',
      image: 'suya.jpg',
      price: 1800,
      rating: 4.2,
      vendor: 'Yahuza Suya',
      wishList: true),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                changeScreen(_, Details(product: productsList[index]));
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(
                    color: Colors.amber[100],
                    offset: Offset(10, 3),
                    blurRadius: 30,
                  )
                ]), // decoration of the box
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'images/${productsList[index].image}',
                        height: 140,
                        width: 140,
                      ),
                    ), // Image of the products
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: productsList[index].name,
                          ),
                        ), // name of the product
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                      color: grey,
                                      offset: Offset(1, 1),
                                      blurRadius: 4)
                                ]),
                            child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: productsList[index].wishList
                                    ? Icon(
                                        Icons.favorite,
                                        color: teal,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        color: teal,
                                      )),
                          ),
                        )
                      ],
                    ), // the favorite icon
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: productsList[index].rating.toString(),
                                color: grey,
                                size: 14,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.star,
                                color: teal,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: teal,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: teal,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: teal,
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 15,
                              ),
                            ],
                          ), // the rating of the products
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: 'N ${productsList[index].price}',
                              weight: FontWeight.bold,
                            ), // price of the product
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ); // the list of featured products
  }
}
