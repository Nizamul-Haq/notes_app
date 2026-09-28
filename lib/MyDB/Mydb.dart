import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/notes_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Mydb {

  Future<Database> database() async {

    final db= openDatabase(
      join(await getDatabasesPath(), 'notes_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, desc TEXT)',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<List<NotesModels>> getData() async {
    List<NotesModels> notes=[];
    final db= await database();
    final data= await db.query("notes");
    for(var note in data){
      NotesModels myNote = NotesModels.fromMap(note);
      notes.add(myNote);
    }
    return notes;
  }


  void insert(NotesModels note) async {
    final db= await database();
    db.insert("notes", note.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }


  void update(NotesModels note) async {
    final db = await database();
    db.update("notes", note.toMap(),where: "id = ?",whereArgs: [note.id]);
  }


  void delete(NotesModels note) async {
    final db= await database();
    db.delete("notes",where: "id = ?",whereArgs: [note.id]);
  }
}