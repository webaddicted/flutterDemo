import 'package:flutter/material.dart';

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
//            padding: EdgeInsets.only(top: 100),
//            color: Colors.deepOrange,
//            alignment: Alignment.center,
            child: Column(
      children: <Widget>[
        getImageView(),
        textViewColor("hello", Colors.deepOrange),
        getRiseButton(context, "click me")
      ],
    )));
  }

  AppBar getAppBar(String title, Color bgColor) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 3,
      title: MaterialWidget().textViewColor(title, Colors.white),
    );
  }

  FloatingActionButton getFloatButton(Icon icon) {
    return FloatingActionButton(
      onPressed: () {
        MaterialWidget().logDubug("floatbutton click");
      },
      tooltip: "click fab button",
      child: icon,
    );
  }

//    message - message of text
//    textColor - color of text
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

  Expanded expandTextView(String message) {
    return Expanded(
        child: Text(message,
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontFamily: "GreatVibes",
                fontWeight: FontWeight.w300)));
  }

  ListView getListView() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.accessibility),
          title: textViewColor("title1", Colors.white),
          subtitle: textViewColor("title1", Colors.white),
          trailing: Icon(Icons.account_circle),
          onTap: () {
            logDubug("title 1");
          },
        ),
        ListTile(
          leading: Icon(Icons.accessibility),
          title: textViewColor("title1", Colors.white),
        ),
        ListTile(
          title: textViewColor("title1", Colors.white),
        ),
        textViewColor("title", Colors.white),
        getImageView()
      ],
    );
  }

  Widget getDynamicList() {
    var listItems = List<String>.generate(1000, (counter) => "Item $counter");
    var listView = ListView.builder(itemBuilder: (context, indexes) {
      return ListTile(
        title: textViewColor(listItems[indexes], Colors.black),
        onTap: () {
          showSnackBar(context, "${listItems[indexes]} was clicked");
          logDubug("${listItems[indexes]} was clicked");
        },
      );
    });
    return listView;
  }

  void logDubug(String s) => debugPrint(s);

  void showSnackBar(BuildContext context, String message) {
    var snackbar = SnackBar(
      content: MaterialWidget().textViewColor(message, Colors.deepOrange),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            logDubug(message + " undo");
          }),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void alertDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: MaterialWidget().textViewColor("title", Colors.deepOrange),
      content:
          MaterialWidget().textViewColor("custom message", Colors.deepOrange),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  getRiseButton(BuildContext context, String btnText) {
    return RaisedButton(
      color: Colors.deepOrange,
      child: MaterialWidget().textViewColor(btnText, Colors.white),
      elevation: 5,
      onPressed: () => alertDialog(context),
    );
  }

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
}
