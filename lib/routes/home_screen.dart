import 'package:flutter/material.dart';
import 'package:notes_app/Providers/notes_provider.dart';
import 'package:notes_app/routes/add_note.dart';
import 'package:notes_app/routes/update_note.dart';
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
        return provider.notes.isEmpty? Center(child: Text("Empty",),) :
        ListView(
          children: [
            for(var note in provider.notes)
              ListTile(
                title: Text(note.title),
                subtitle: Text(note.desc),
                trailing: IconButton(onPressed: (){
                  showDialog(
                    context:context,
                    builder:(context){
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text("Update Note"),
                              trailing: IconButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateNote(note: note)),);
                                  },
                                  icon: Icon(Icons.note_alt_outlined)),
                            ),
                            ListTile(
                              title: Text("Delete Note"),
                              trailing: IconButton(
                                  onPressed: (){
                                    Provider.of<NotesProvider>(context,listen: false).delete(note);
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.delete)),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                  icon: Icon(Icons.more_vert_rounded),),
              )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddNote()));
      },
      child: Icon(Icons.add),),
    );
  }
}

