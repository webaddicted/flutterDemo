import 'package:flutter/material.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';
import 'package:flutter_app/view/global/utils/widget_utils.dart';
import 'package:flutter_app/view/global/utils/validation_helper.dart';

class NoteLists extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListsState();
  }
}

class NoteListsState extends State<NoteLists> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("notes list", Colors.teal),
      body: getNotesList(),
      floatingActionButton: getFloatButton(Icon(Icons.add)),
    );
  }

  getNotesList() {
    ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int postion) {
          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: textViewColor("Dummy Text", Colors.black),
              subtitle: textViewColor("Dummy Text", Colors.black),
              trailing: Icon(Icons.delete, color: Colors.grey),
              onTap: () {},
            ),
          );
        });
  }
}
