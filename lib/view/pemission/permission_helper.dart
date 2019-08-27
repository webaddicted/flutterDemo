import 'package:flutter/material.dart';
import 'package:flutter_app/global/utils/widget_utils.dart';
import 'package:flutter_app/view/allWidgets/all_list.dart';

class PermissionHelper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PermissionHelperState();
  }
}

class PermissionHelperState extends State<PermissionHelper> {
  @override
  Widget build(BuildContext context) {
    return getPermission();
  }

  getPermission() {
    return Scaffold(
      appBar: AppBar(
        title: textViewWhiteColor("permission helper"),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {navigationPop(context, AllLists());}),
      ),
      body: getButtonUi(),
    );
  }

  getButtonUi() {
    return ListView(children: <Widget>[
      RaisedButton(
          color: Colors.blue,
          child: textViewBlackColor('requset permission'),
          elevation: 2,
          onPressed: () {
            debugPrint('hello click');
          })
    ]);
  }
}
