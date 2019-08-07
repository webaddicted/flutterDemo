import 'package:flutter/material.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';
import 'package:flutter_app/view/uiDesign/si_calculator/si_simple_interest.dart';
import 'package:flutter_app/view/uiDesign/si_calculator/si_simple_interest_form.dart';
import 'package:flutter_app/global/db/widget_utils.dart';
import 'package:flutter_app/view/uiDesign/note_pad/notes_list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "notes",
    theme: getThemeColor(),
//    home: SimpleInterestUi(),
    home: NoteLists(),
  ));
}
