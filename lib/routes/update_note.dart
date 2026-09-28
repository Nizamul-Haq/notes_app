import 'package:flutter/material.dart';
import 'package:notes_app/routes/home_screen.dart';
import 'package:provider/provider.dart';

import '../MyDB/Mydb.dart';
import '../Providers/notes_provider.dart';
import '../models/notes_models.dart';

class UpdateNote extends StatefulWidget {
  final NotesModels note;
  const UpdateNote({super.key, required this.note});

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {

  Mydb db = Mydb();
  @override
  @override
  void initState() {
    title.text=widget.note.title;
    desc.text=widget.note.desc;
    super.initState();
  }
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Note"),
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
                      id: widget.note.id,
                      title: title.text,
                      desc: desc.text,
                    );
                    Provider.of<NotesProvider>(context,listen: false).update(note);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
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

