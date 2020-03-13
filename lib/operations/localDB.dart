import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Event {
  String date;
  String title;

  Event({@required this.date, @required this.title});

  Map<String, dynamic> toMap() {
    return {'title': this.title, 'date': this.date};
  }
}

class DatabaseOperations {
  Future<String> getPathOfDatabase() async {
    String path = await getDatabasesPath();
    return join(path, "events.db");
  }

  Future<Database> openDB() async {
    String _databasePath = await getPathOfDatabase();

    if (await databaseExists(_databasePath)) {
      return await openDatabase(_databasePath);
    }
    openDatabase(_databasePath, version: 1,
        onCreate: (database, version) async {
      await database.execute("CREATE TABLE Events(title TEXT PRIMARY KEY, date TEXT)");
    });
    return openDatabase(_databasePath);
  }

  Future<void> addNewEvent(String title, DateTime date) async {
    Database database = await openDB();
    Event newEvent = Event(date: date.toString(), title: title);
    database.insert('Events', newEvent.toMap(),conflictAlgorithm: ConflictAlgorithm.ignore);
    int version = await database.getVersion();
    database.setVersion(version + 1);
  }

  Future<List<Map<String, dynamic>>> getEvents() async {

    String _databasePath = await getPathOfDatabase();
    Database _db;
    if (await databaseExists(_databasePath)) {
      _db = await openDatabase(_databasePath);
    }else{
      return [];
    }
    List<Map<String, dynamic>> events = await _db.query('Events');
    return events;
  }

  Future deleteAnEvent(String title) async {
    String _databasePath = await getPathOfDatabase();
    Database _db;
    if (await databaseExists(_databasePath)) {
      _db = await openDatabase(_databasePath);
    }
    await _db.delete('Events', where: 'title = ?', whereArgs: [title]);
  }

  Future deleteDatabase() async {
    String _databasePath = await getPathOfDatabase();
    Database _db =await openDatabase(_databasePath);
    await _db.delete('Events');
  }
}
