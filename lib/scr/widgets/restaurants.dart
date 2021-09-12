import 'package:flutter/material.dart';
import 'package:zorex_food/scr/helpers/commons.dart';
import 'package:zorex_food/scr/models/restaurants.dart';
import 'package:zorex_food/scr/widgets/small_button.dart';

List<Restaurant> restaurantList = [
  Restaurant(
      name: 'Chicken Capitol',
      image: 'chicken-capitol.jpg',
      rating: 4.2,
      wishList: true),
  Restaurant(
      name: 'Chicken Republic',
      image: 'chicken-republic.jpg',
      rating: 4.2,
      wishList: true),
  Restaurant(
    name: 'Domino',
    image: 'domino.jpg',
    rating: 4.2,
    wishList: true,
  ),
  Restaurant(
    name: 'Drumstix',
    image: 'drumstix.jpg',
    rating: 4.2,
    wishList: true,
  ),
  Restaurant(
    name: 'KFC',
    image: 'kfc.jpg',
    rating: 4.2,
    wishList: true,
  ),
  Restaurant(
    name: 'Ojuelegba',
    image: 'ojuelgba.jpg',
    rating: 4.2,
    wishList: true,
  ),
  Restaurant(
    name: 'Yahuza Suya Spot',
    image: 'yahuza.jpg',
    rating: 4.2,
    wishList: true,
  ),
];

class Restaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: restaurantList.length,
        itemBuilder: (_, index) {
          return Stack(children: [
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('images/chicken-capitol.jpg')),
              height: 140,
              width: 140,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallButton(
                    Icons.favorite,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 240.0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ),
                            Text('4.0')
                          ],
                        ),
                      )),
                  Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.025),
                      ]),
                ),
              ),
            )),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Party Jellof Pack \n',
                              style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                          TextSpan(
                              text: 'by: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: white,
                                  fontWeight: FontWeight.w300)),
                          TextSpan(
                              text: 'Chicken Republic',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'N 2800.0',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                  color: white)),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}
