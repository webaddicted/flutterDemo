import 'package:flutter/material.dart';

// setThemeColor
ThemeData getThemeColor() {
  return ThemeData(cursorColor: Colors.deepOrange, primaryColor: Colors.yellow);
}

// set appbar
AppBar getAppBar(String title, Color bgColor) {
  return AppBar(
    backgroundColor: bgColor,
    elevation: 3,
    title: textViewColor(title, Colors.white),
  );
}

// show debug log
void logDubug(String s) => debugPrint(s);

//  alert dialog
void alertDialog(BuildContext context) {
  var alertDialog = AlertDialog(
    title: textViewColor("title", Colors.deepOrange),
    content: textViewColor("custom message", Colors.deepOrange),
  );
  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}

//show snackbar
void showSnackBar(BuildContext context, String message) {
  var snackbar = SnackBar(
    content: textViewColor(message, Colors.deepOrange),
    action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          logDubug(message + " undo");
        }),
  );
  Scaffold.of(context).showSnackBar(snackbar);
}

// show button
getRiseButton(BuildContext context, String btnText) {
  return RaisedButton(
    color: Colors.deepOrange,
    child: textViewColor(btnText, Colors.white),
    elevation: 5,
    onPressed: () => alertDialog(context),
  );
}

// show image view
getImageView() {
  AssetImage assetImage = AssetImage("images/logo.png");
  Image imageLogo = Image(
    image: assetImage,
    width: 100,
    height: 100,
  );
  return Container(
    alignment: Alignment.topCenter,
    child: imageLogo,
  );
}

// show text view
Text textViewColor(String message, Color textColor) {
  return Text(message,
      textDirection: TextDirection.ltr,
      style: TextStyle(
          fontSize: 30,
          color: textColor,
          decoration: TextDecoration.none,
          fontFamily: "GreatVibes",
          fontWeight: FontWeight.w300));
}

// show floating button
getFloatButton(Icon icon) {
  return FloatingActionButton(
    onPressed: () {
      logDubug("floatbutton click");
    },
    tooltip: "click fab button",
    child: icon,
  );
}
