import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Providers/notes_provider.dart';
import 'package:notes_app/routes/add_note.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Notes"),
      centerTitle: true,
      ),
      body: Consumer<NotesProvider>(builder: (context,provider,child){
        return provider.notes.isEmpty? Center(child: Text("Empty",),) : ListView(
          children: [
            for(var note in provider.notes)
              ListTile(
                title: Text(note.title),
                subtitle: Text(note.desc),
                trailing: Icon(Icons.delete),
              )
          ],
        );

      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddNote()));
      }),
    );
  }
}

