import 'dart:io';
import 'package:flutter_app/model/user/user_bean.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/model/note/note_dean.dart';
import 'package:path/path.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  String noteTable = 'NoteTable';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DbHelper._createInstance();

  factory DbHelper() {
    if (_dbHelper == null) _dbHelper = DbHelper._createInstance();
    return _dbHelper;
  }

  Future<Database> get database async {
    if (_database == null) _database = await initializeDb();
    return _database;
  }

  Future<Database> initializeDb() async {
    /*Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/not.db';*/
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    var noteDb = await openDatabase(path, version: 2, onCreate: (Database db, int version) async {
      await db.execute( 'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
    return noteDb;
  }
//   String DICTIONARY_TABLE_NAME = "dictionary";
   String DICTIONARY_TABLE_CREATE =
      "CREATE TABLE " +  "dictionary (" +
           "id TEXT, " +
          "key TEXT);";

  void _createDb(Database db,int vers) async {
   return await db.execute('CREATE TABLE $noteTable (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');

//       'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY, $colTitle TEXT,'
//        '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }

// get all data from db
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db =  _database;
//    var rawResult = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC'); // raw query
    var result = await db.query(noteTable, orderBy: 'ASC'); // normal query
    return result;
  }

// insert data in db
  Future<int> insertNote(Note note) async {
    Database db = _database;
//    var rawResult = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

// update raw in db
  Future<int> updateNote(Note note) async {
    Database db = await this.database;
//    var rawResult = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

// delete id data from db
  Future<int> deleteNote(int id) async {
    Database db = await this.database;
//    var rawResult = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result =
        await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

// get number of objet in db
  Future<int> getCount(int id) async {
    Database db = await this.database;
//    var rawResult = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    List<Map<String, dynamic>> count =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(count);
    return result;
  }

  // get the map list then convert into note list
  Future<List<Note>> getNoteList() async {
    var getNoteList = await getNoteMapList();
    int count = getNoteList.length;
    List<Note> noteLists = List<Note>();
    for (int i = 0; i < count; i++) {
      noteLists.add(Note.fromMapObject(getNoteList[i]));
    }
    return noteLists;
  }
}
