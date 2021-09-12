import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:zorex_food/scr/helpers/commons.dart';
import 'package:zorex_food/scr/models/products.dart';
import 'package:zorex_food/scr/widgets/custom_text.dart';

class Details extends StatefulWidget {
  final Product product;

  const Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Carousel(
                    images: [
                      AssetImage('images/${widget.product.image}'),
                      AssetImage('images/${widget.product.image}'),
                      AssetImage('images/${widget.product.image}'),
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: amber,
                    dotIncreaseSize: 1.2,
                    autoplay: false,
                  ), // used to make the images scrollable
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.amber[200],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.amber[200],
                                  size: 35,
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
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 4),
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
                  Align(
                    alignment: Alignment.topRight,
                  ),
                  // Row(
                  //   children: [
                  //
                  //   ],
                  // ),
                  Positioned(
                    right: 12,
                    bottom: 60,
                    child: Padding(
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
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.favorite,
                              color: teal,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            CustomText(
              text: widget.product.name,
              size: 24,
              weight: FontWeight.bold,
            ),
            CustomText(
              text: 'N ' + widget.product.price.toString(),
              size: 18,
              weight: FontWeight.w400,
              color: Colors.teal[700],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      print('Added item quantity reduced');
                    },
                    icon: Icon(Icons.remove),
                    iconSize: 32,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('add to cart tapped');
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.teal[700]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                      child: CustomText(
                        text: 'Add To Cart',
                        color: white,
                        size: 26,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      print('Added item quantity added');
                    },
                    icon: Icon(Icons.add),
                    iconSize: 32,
                    color: Colors.teal[700],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
