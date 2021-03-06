import 'package:flutter/material.dart';
import 'package:flutter_app/global/db/db_helper.dart';
import 'package:flutter_app/model/note/note_dean.dart';
import 'package:flutter_app/view/allWidgets/all_list.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';
import 'package:flutter_app/global/utils/widget_utils.dart';
import 'package:flutter_app/global/utils/widget_utils.dart';
import 'package:flutter_app/view/uiDesign/note_pad/notes_list.dart';
import 'package:sqflite/sqlite_api.dart';

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
  DbHelper _dbHHelper = DbHelper();
  List<Note> noteList;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
      debugPrint('note list  test-> ');
    }
    return Scaffold(
      appBar: AppBar(
        title: textViewWhiteColor('notes list'),
        backgroundColor: Colors.green,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              navigationPop(context, AllLists());
            }),
      ),
      body: getNotesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationPush(context, AddNotes("add notes", null));
          logDubug("floatbutton click");
        },
        tooltip: "click fab button",
        child: Icon(Icons.add),
      ),
    );
  }

  getNotesList() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    getPriorityColor(this.noteList[position].priority),
                child: getPriorityIcon(this.noteList[position].priority),
              ),
              title: textViewBlackColor(this.noteList[position].title),
              subtitle: textViewColor(
                  this.noteList[position].description, Colors.black),
              trailing: GestureDetector(
                child: Icon(Icons.delete, color: Colors.grey),
                onTap: () {
                  deleteNote(context, noteList[position]);
                },
              ),
              onTap: () {
                navigationPush(
                    context, AddNotes("update notes", noteList[position]));
              },
            ),
          );
        });
  }

  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      case 3:
        return Icon(Icons.book);
        break;
      default:
        return Icon(Icons.book);
    }
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      case 3:
        return Colors.cyanAccent;
        break;
      default:
        return Colors.cyanAccent;
    }
  }

  void deleteNote(BuildContext context, Note note) async {
    int result = await _dbHHelper.deleteNote(note.id);
    if (result != 0) showSnackBar(context, 'note delete successfully');
    updateListView();
  }

  void updateListView() {
    Future<Database> dbFuture = _dbHHelper.database;
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = _dbHHelper.getNoteList();
      debugPrint('note list  future -> ${noteListFuture.toString()}');
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
          debugPrint('note list   list   me  -> ${noteList.length}');
        });
      });
    });
  }
}
