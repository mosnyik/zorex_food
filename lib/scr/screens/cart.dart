import 'package:flutter/material.dart';
import 'package:zorex_food/scr/helpers/commons.dart';
import 'package:zorex_food/scr/models/products.dart';
import 'package:zorex_food/scr/widgets/custom_text.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  Product product = Product(
      name: 'Pizza',
      category: 'Pasta & Noodles',
      image: 'pizza.jpg',
      price: 3200,
      rating: 4.2,
      vendor: 'Chicken Republic',
      wishList: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: 'Item Cart',
          weight: FontWeight.w600,
          size: 20,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {
                      print('view cart items');
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.teal[700],
                      size: 32,
                    )), // the cart
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                    left: 17,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: white,
                                offset: Offset(2, 2),
                                blurRadius: 5),
                          ],
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4),
                        child: CustomText(
                          text: '3',
                          color: Colors.grey[100],
                          weight: FontWeight.bold,
                        ),
                      )),
                ) // the cart with the number of items selected
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 120,
              // width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                  color: Colors.teal[50],
                  offset: Offset(3, 5),
                  blurRadius: 30,
                )
              ]),
              child: Row(
                children: [
                  Image.asset(
                    'images/${product.image}',
                    height: 140,
                    width: 140,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: product.name + '\n',
                              style: TextStyle(color: black, fontSize: 20)),
                          TextSpan(
                              text: product.price.toString() + '\n',
                              style: TextStyle(color: black, fontSize: 16))
                        ])),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        color: Colors.grey[600],
                        iconSize: 35,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
