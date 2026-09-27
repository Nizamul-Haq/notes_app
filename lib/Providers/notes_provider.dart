import 'package:flutter/material.dart';
import 'package:notes_app/MyDB/Mydb.dart';
import 'package:notes_app/models/notes_models.dart';

class NotesProvider with ChangeNotifier {
  Mydb db = Mydb();
  List<NotesModels> notes = [];

  NotesProvider() {
    getNotes();
  }

  getNotes() async {
    notes = await db.getData();
    notifyListeners();
  }

  insert(NotesModels note) async {
    db.inset(note);
    getNotes();
  }

  update(NotesModels note) async {
    db.update(note);
    getNotes();
  }

  delet(NotesModels note) async {
    db.delete(note);
    getNotes();
  }
}
