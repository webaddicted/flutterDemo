import 'package:flutter/material.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';
import 'package:flutter_app/view/global/utils/widget_utils.dart';
import 'package:flutter_app/view/uiDesign/note_pad/notes_list.dart';

import 'package:flutter_app/view/global/utils/validation_helper.dart';

import 'add_notes.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationPush(context, AddNotes("add notes"));
          logDubug("floatbutton click");
        },
        tooltip: "click fab button",
        child: Icon(Icons.add),
      ),
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
              title: textViewBlackColor("Dummy Text"),
              subtitle: textViewBlackColor("Dummy Sub Text"),
              trailing: Icon(Icons.delete, color: Colors.grey),
              onTap: () {
                navigationPush(context, AddNotes("update notes"));
              },
            ),
          );
        });
  }
}
