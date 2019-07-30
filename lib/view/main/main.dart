import 'package:flutter/material.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';
import 'package:flutter_app/view/uiDesign/si_simple_interest.dart';
import 'package:flutter_app/view/uiDesign/si_simple_interest_form.dart';
import 'package:flutter_app/view/global/utils/widget_utils.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "SI Form",
    theme:getThemeColor(),
//    home: SimpleInterestUi(),
    home: SimpleInterestFormUi(),
  ));
}