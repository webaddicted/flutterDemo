import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/global/db/widget_utils.dart';

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Column(
      children: <Widget>[
        getImageView(),
        textViewColor("hello", Colors.deepOrange),
        getRiseButton(context, "click me"),
        textViewColor("lucky number test  is - ${getLuckyNumber()}", Colors.deepOrange),
        Expanded(
          child: textViewColor("hi this is testing word", Colors.deepOrange),
        )
      ],
    )));
  }

// show static list view
  getListView() {
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

// show dynamic list view
  getDynamicList() {
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


//    get user lucky numbers
  int getLuckyNumber() {
    return Random().nextInt(10);
  }
}
