import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreenDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
          child: Text("lucky number test  is - ${getLuckyNumber()}",
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.teal, fontSize: 30)) //Text
          ), //Centre
    ); //material
  }

  /**
   * get user lucky numbers
   */
  int getLuckyNumber() {
    return Random().nextInt(10);
  }
}
