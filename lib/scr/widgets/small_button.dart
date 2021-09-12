import 'package:flutter/material.dart';
import 'package:zorex_food/scr/helpers/commons.dart';

class SmallButton extends StatelessWidget {
  final IconData icon;

  SmallButton(this.icon);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber[100],
            borderRadius: BorderRadiusDirectional.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            Icons.favorite,
            color: teal,
            size: 16,
          ),
        ),
      ),
    );
  }
}
