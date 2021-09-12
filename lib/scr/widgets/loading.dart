import 'package:flutter/material.dart';
import 'package:zorex_food/scr/helpers/commons.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: amber,
        ),
      ],
    );
  }
}
