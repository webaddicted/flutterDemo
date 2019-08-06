import 'package:flutter/material.dart';
import 'package:flutter_app/global/db/db_helper.dart';
import 'package:flutter_app/model/note/note_dean.dart';
import 'package:flutter_app/view/widget/widget_screen.dart';
import 'package:flutter_app/global/db/widget_utils.dart';
import 'package:flutter_app/global/db/widget_utils.dart';
import 'package:sqflite/sqlite_api.dart';

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
    }
    return Scaffold(
      appBar: getAppBar("notes list", Colors.teal),
      body: getNotesList(),
      floatingActionButton: getFloatButton(Icon(Icons.add)),
    );
  }

  getNotesList() {
    ListView.builder(
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
              onTap: () {},
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
    Future<Database> dbFuture = _dbHHelper.initializeDb();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = _dbHHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
