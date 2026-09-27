import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/MyDB/Mydb.dart';
import 'package:notes_app/models/notes_models.dart';
import 'package:path/path.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  Mydb db=Mydb();
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 15,
            children: [
              TextField(
                controller: title,
                decoration: InputDecoration(hintText: "Title"),
              ),
              TextField(
                controller: desc,
                maxLines: 3,
                decoration: InputDecoration(hintText: "Description....."),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  NotesModels note=NotesModels(title: title.text, desc: desc.text);
                  db.inset(note);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,

                ),
                child: Text("Save"),),
            ],
          ),
        ),
      ],
    );
  }
}
