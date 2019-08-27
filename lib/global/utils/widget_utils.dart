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
//void alertDialog(BuildContext context) {
//  var alertDialog = AlertDialog(
//    title: textViewColor("title", Colors.deepOrange),
//    content: textViewColor("custom message", Colors.deepOrange),
//  );
//  showDialog(context: context, builder: (BuildContext context) => alertDialog);
//}

//  alert dialog
void alertMessageDialog(BuildContext context, String titles,String description) {
  var alertDialog = AlertDialog(
    title: textViewColor(titles, Colors.deepOrange),
    content: textViewColor(description, Colors.deepOrange),
  );
  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}

//show snackbar
void showSnackBar(BuildContext context, String message) {
  var snackbar = SnackBar(
    content: textViewColor(message, Colors.deepOrange),
//    action: SnackBarAction(
//        label: "Undo",
//        onPressed: () {
//          logDubug(message + " undo");
//        }),
  );
  Scaffold.of(context).showSnackBar(snackbar);
}
// show button
getRiseButton(BuildContext context, String btnText) {
  return RaisedButton(
    color: Colors.deepOrange,
    child: textViewColor(btnText, Colors.white),
    elevation: 5,
    onPressed: () => alertMessageDialog(context,'title','custom message '),
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
          fontSize: 25,
          color: textColor,
          decoration: TextDecoration.none,
          fontFamily: "GreatVibes",
          fontWeight: FontWeight.w300));
}

// show text view
Text textViewBlackColor(String message) {
  return Text(message,
      textDirection: TextDirection.ltr,
      style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          decoration: TextDecoration.none,
          fontFamily: "GreatVibes",
          fontWeight: FontWeight.w300));
}
// show text view
Text textViewWhiteColor(String message) {
  return Text(message,
      textDirection: TextDirection.ltr,
      style: TextStyle(
          fontSize: 25,
          color: Colors.white,
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

getDecorationStyle(String labelText, String hintText) {
  return InputDecoration(
      labelText: labelText,
      //"principal",
      hintText: hintText,
      //"enter principal e.g. 1200",
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: 15,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.3)));
}

textStyle() {
  return TextStyle(
    fontFamily: "GreatVibes",
    fontSize: 25,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
}

void navigationPush(BuildContext context, StatefulWidget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navigationPop(BuildContext context, StatefulWidget route) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}
void navigationStateLessPush(BuildContext context, StatelessWidget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navigationStateLessPop(BuildContext context, StatelessWidget route) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}