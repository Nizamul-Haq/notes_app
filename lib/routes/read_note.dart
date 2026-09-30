import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_models.dart';

class ReadNote extends StatefulWidget {
  final NotesModels note;
  const ReadNote({super.key, required this.note});

  @override
  State<ReadNote> createState() => _ReadNoteState();
}

class _ReadNoteState extends State<ReadNote> {
  TextEditingController title=TextEditingController();
  TextEditingController desc=TextEditingController();
  @override
  void initState() {
    title.text=widget.note.title;
    desc.text=widget.note.desc;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Read Note"),
        centerTitle: true,),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title.text,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(height: 3,),
          Flexible(
            child: Container(
              width: double.infinity,
              height: double.maxFinite,
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(desc.text,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
