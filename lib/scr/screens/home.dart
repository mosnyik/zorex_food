import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zorex_food/scr/helpers/commons.dart';
import 'package:zorex_food/scr/helpers/screen_navigation.dart';
import 'package:zorex_food/scr/screens/cart.dart';
import 'package:zorex_food/scr/widgets/categories.dart';
import 'package:zorex_food/scr/widgets/custom_text.dart';
import 'package:zorex_food/scr/widgets/featured_products.dart';
import 'package:zorex_food/scr/widgets/restaurants.dart';
// import 'package:zorex_food/scr/widgets/small_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zorex Food App'),
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  changeScreen(context, ShoppingCart());
                },
              ),
              Positioned(
                // the red dot on the notification icon
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: red, borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              Positioned(
                // the red dot on the notification icon
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: red, borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: CustomText(
                  text: 'Name of User',
                  size: 25,
                  weight: FontWeight.bold,
                ),
                accountEmail: CustomText(
                  text: 'Email of user',
                  size: 20,
                  weight: FontWeight.normal,
                )),
            ListTile(
              leading: Icon(Icons.home),
              title: CustomText(
                text: 'Home',
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: CustomText(
                text: 'Profile',
              ),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, ShoppingCart());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(
                text: 'Cart',
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: CustomText(
                text: 'Settings',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: ListTile(
                onTap: () async {
                  // authProvider.signOut();
                },
                dense: true,
                leading: Icon(
                  Icons.exit_to_app,
                  size: 40,
                ),
                title: CustomText(
                  text: 'Sign Out',
                  size: 25,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      // background of the UI
      body: SafeArea(
          // gives the content some border to allow time
          // and other things to display
          child: ListView(
              // allows for the items on the UI to be scrollable
              children: [
            Container(
              decoration: BoxDecoration(
                  color: teal,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 32, bottom: 16.0),
                child: Container(
                  // this is the search bar decoration
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: amber,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: 'Find food or restaurant',
                          border: InputBorder.none),
                    ),
                    trailing: Icon(
                      Icons.filter_list_rounded,
                      color: amber,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(), // categories from widgets folder
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Featured ',
                size: 20,
                color: grey,
              ),
            ), // featured text
            Featured(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
              child: CustomText(
                text: 'Popular Restaurants',
                size: 20,
                color: grey,
              ),
            ), // Popular text
            Restaurants(),
          ])),
    );
  }
}
