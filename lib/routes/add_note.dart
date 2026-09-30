import 'package:flutter/material.dart';
import 'package:notes_app/MyDB/Mydb.dart';
import 'package:notes_app/Providers/notes_provider.dart';
import 'package:notes_app/models/notes_models.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  Mydb db = Mydb();
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Add Note"),
      ),
      body: ListView(
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
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    NotesModels note = NotesModels(
                      title: title.text,
                      desc: desc.text,
                    );
                    Provider.of<NotesProvider>(context,listen: false).insert(note);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigoAccent,
                  ),
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
