import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/global/utils/widget_utils.dart';
import 'package:flutter_app/view/allWidgets/all_list.dart';

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: textViewWhiteColor('all widgets'),
            elevation: 2,
            backgroundColor: Colors.orangeAccent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                navigationPop(context, AllLists());
              },
            )),
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    getImageView(),
                    textViewColor("hello", Colors.deepOrange),
                    getRiseButton(context, "click me"),
                    textViewColor("lucky number test  is - ${getLuckyNumber()}",
                        Colors.deepOrange),
                    Expanded(
                      child: textViewColor(
                          "hi this is testing word", Colors.deepOrange),
                    )
                  ],
                ))));
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
